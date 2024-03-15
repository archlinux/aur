# Maintainer: OpenJowel <openjowel AT huenicorn DOT org>
#
# This package installs Huenicorn on the system

pkgname="huenicorn"
arch=('i686' 'x86_64')
pkgver=1.0.6
pkgrel=1
pkgdesc="Free bias lighting driver for Philips Hue™ devices"
url='https://gitlab.com/openjowelsofts/huenicorn'
license=('GNU GPLv3')
source=(
  "git+https://gitlab.com/openjowelsofts/huenicorn.git#tag=v${pkgver}"
  "https://huenicorn.org/releases/extra/huenicorn.sh"
)
sha512sums=(
  'SKIP'
  'SKIP'
)
depends=('opencv' 'curl' 'restbed' 'mbedtls')
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
  install -d "${builddir}/webroot" "${optdir}/webroot"
  cp -r "${builddir}/webroot" "${optdir}/"
}
