# Maintainer: robertfoster

pkgname=assaultcube-reloaded
pkgver=2.18.2
pkgrel=1
pkgdesc='AssaultCube Reloaded'
arch=('i686' 'x86_64')
url='http://acr.victorz.ca'
license=('ZLIB')
depends=('curl' 'gcc-libs' 'libgl' 'libvorbis' 'libx11' 'openal' 'sdl' 'sdl_image' 'zlib')
source=("https://github.com/actf/acr/archive/v${pkgver}.tar.gz"
  'acreloaded'
  'acreloaded-server'
  'acreloaded.desktop'
  'acreloaded.svg'
)

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

md5sums=('6ee80508b35cc0ea1d8b44f537f9b32c'
         '8ab0b28867ade9fd720167443ada886a'
         '21e8ad1669ed0d54331dcec2d9569688'
         'faf59a6be0054bcc09a4a01df7eb8e6c'
         '3b142417157d73da4a7981fd07bcb628')
