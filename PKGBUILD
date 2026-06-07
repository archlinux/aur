# Maintainer: OpenJowel <OpenJowel AT proton DOT me>
#
# This package installs Huenicorn on the system

pkgname="huenicorn"
arch=('x86_64')
pkgver=1.0.12
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
  'SKIP'
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
