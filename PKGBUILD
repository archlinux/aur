# Maintainer: OpenJowel <OpenJowel AT proton DOT me>
#
# This package installs Huenicorn on the system

pkgname="huenicorn"
arch=('x86_64')
pkgver=1.1.0
pkgrel=1
pkgdesc="Free bias lighting driver for Philips Hue™ devices"
url='https://gitlab.com/openjowelsofts/huenicorn'
license=('GPL3')
source=(
  "git+https://gitlab.com/openjowelsofts/huenicorn.git#tag=v${pkgver}"
  "huenicorn.desktop"
)
sha512sums=(
  'SKIP'
  '87990af06570092894ba0f639d34e79b66c8ebb769f431cf7a936ba16e17a9a1a7fce020e514a860a4fd24af1f2b5a4042031ef8dab49802d16bdd2852521585'
)
depends=('opencv' 'curl' 'mbedtls')
optdepends=('libx11' 'libxext' 'libxrandr' 'wayland' 'glib2' 'pipewire')
makedepends=('git' 'cmake')

build(){
  cd ${pkgname}
  mkdir -p build && cd build
  cmake ..
  make
}

package() {
  builddir=${srcdir}/${pkgname}/build
  install -Dm755 "${builddir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/huenicorn.svg"
  install -Dm755 "huenicorn.desktop" "${pkgdir}/usr/share/applications/huenicorn.desktop"
}
