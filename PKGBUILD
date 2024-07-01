# Maintainer: OpenJowel <openjowel AT huenicorn DOT org>
#
# This package installs Huenicorn on the system

pkgname="huenicorn"
arch=('i686' 'x86_64')
pkgver=1.0.8
pkgrel=4
pkgdesc="Free bias lighting driver for Philips Hue™ devices"
url='https://gitlab.com/openjowelsofts/huenicorn'
license=('GNU GPLv3')
source=(
  "git+https://gitlab.com/openjowelsofts/huenicorn.git#tag=v1.0.8"
  "huenicorn.desktop"
  "huenicorn.sh"
)
sha512sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)
depends=('opencv' 'curl' 'mbedtls')
optdepends=('libx11' 'libxext' 'libxrandr' 'wayland' 'glib2' 'pipewire')
makedepends=('git' 'cmake' 'nlohmann-json' 'glm' 'asio' 'crow')

build(){
  cd ${pkgname}
  mkdir -p build && cd build
  cmake ..
  make -j4
}

package() {
  optdir=${pkgdir}/opt/${pkgname}
  builddir=${srcdir}/${pkgname}/build
  install -Dm755 "${builddir}/${pkgname}" "${optdir}/${pkgname}"
  install -Dm755 "huenicorn.sh" "${pkgdir}/usr/bin/huenicorn"
  install -Dm755 "${srcdir}/${pkgname}/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/huenicorn.svg"
  install -Dm755 "huenicorn.desktop" "${pkgdir}/usr/share/applications/huenicorn.desktop"
  install -d "${builddir}/webroot" "${optdir}/webroot"
  cp -r "${builddir}/webroot" "${optdir}/"
}
