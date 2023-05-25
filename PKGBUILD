# Maintainer: OpenJowel <openjowel AT huenicorn DOT org>
#
# This package installs Huenicorn on the system

pkgname="huenicorn"
arch=('i686' 'x86_64')
pkgver=v1.0.2
pkgrel=2
pkgdesc="Free ambilight driver for Philips Hue™ devices"
url='https://gitlab.com/openjowelsofts/huenicorn'
license=('GNU GPLv3')
source=(
  "git+https://gitlab.com/openjowelsofts/huenicorn.git"
  "huenicorn.sh"
)
sha512sums=(
  'SKIP'
  '588bd3d72be5d5684ceaf0c5e5d032c5dee8aa75e46bd64913b20f582c30191011ed867bf030954a4b39a5e3c33d18a299ad7f7ee9ae83d5a74793122be949b1'
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
