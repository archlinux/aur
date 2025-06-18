# Maintainer: robertfoster

pkgname=assaultcube-reloaded
pkgver=2.18.3 # renovate: datasource=github-tags depName=actf/acr
pkgrel=1
pkgdesc='AssaultCube Reloaded'
arch=('i686' 'x86_64')
url='http://acr.victorz.ca'
license=('Zlib')
depends=('curl' 'libgl' 'libvorbis' 'libx11' 'openal' 'sdl12-compat' 'sdl_image' 'zlib')
source=("https://github.com/actf/acr/archive/v${pkgver}.tar.gz"
  'acreloaded'
  'acreloaded-server'
  'acreloaded.desktop'
  'acreloaded.svg'
)

build() {
  cd "${srcdir}/acr-${pkgver}/source/src"

  CXXFLAGS+=" -Wno-error=format-security"
  make
}

package() {
  cd "${srcdir}/acr-${pkgver}/source/src"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/acreloaded"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/acr-${pkgver}"
  cp -rf bot config packages acr/packages \
    "${pkgdir}/usr/share/acreloaded"

  install -Dm755 bin_unix/native_client \
    "${pkgdir}/usr/share/acreloaded/native_client"
  install -Dm755 bin_unix/native_server \
    "${pkgdir}/usr/share/acreloaded/native_server"
  install -Dm644 "${srcdir}/acreloaded.svg" \
    "${pkgdir}/usr/share/pixmaps/acreloaded.svg"
  install -Dm644 "${srcdir}/acreloaded.desktop" \
    "${pkgdir}/usr/share/applications/acreloaded.desktop"
  install -Dm755 "${srcdir}/acreloaded" \
    "${pkgdir}/usr/bin/acreloaded"
  install -Dm755 "${srcdir}/acreloaded-server" \
    "${pkgdir}/usr/bin/acreloaded-server"
}

sha256sums=('7f919e0b4aed4cf8b7129a69236e71bd1e583e8b349e890be7bc810471e042da'
  '95f1c263061604c46a8425020df5376e9ef182724077d744f9d2420e414ff6e3'
  '4943274e4d43174bd06bda86b8951bc86252e0d7c06abd7183e01388b4829805'
  'a1e3b84ed6130a01afb52abd894d8a9175b2a09b574cb24962c9866dc48f58d3'
  'aeb6b8028181e791a43c1885fb88f04498237a15bdb6da767caa4c8ab8065234')
