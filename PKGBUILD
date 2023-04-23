# Maintainer: OpenJowel <openjowel AT huenicorn DOT org>
#
# This package installs Huenicorn on the system

pkgname="huenicorn"
arch=('i686' 'x86_64')
pkgver=v1.0.1.r0.gb1567b6
pkgrel=1
pkgdesc="Free ambilight driver for Philips Hue™ devices"
url='https://gitlab.com/openjowelsofts/huenicorn'
license=('GNU GPLv3')
source=(
  "git+https://gitlab.com/openjowelsofts/huenicorn.git"
  "https://huenicorn.org/releases/extra/huenicorn.sh"
)
sha512sums=(
  'SKIP'
  'SKIP'
)
depends=('libx11' 'libxext' 'libxrandr' 'opencv' 'curl' 'libcurlpp' 'restbed' 'mbedtls')
makedepends=('git' 'nlohmann-json' 'glm')


pkgver(){
  cd "$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}


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
