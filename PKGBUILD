# Maintainer: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>

pkgname=alienfx-lite
pkgver=1.0
pkgrel=1
pkgdesc="A keyboard color management tool for Alienware laptops (written in Java with a C++ native library)"
arch=('i686' 'x86_64')
url="https://github.com/bchretien/AlienFxLite"
license=('GPL')
depends=('java-runtime' 'java-environment-common' 'libusb')
makedepends=('cmake')
source=("https://github.com/bchretien/AlienFxLite/archive/v${pkgver}.tar.gz")
sha256sums=('92a8fbc428b0f5d3757d8bf199c6513ce95254423767e8389560c2553eaa9c78')

_dir="AlienFxLite-${pkgver}"

prepare() {
  cd "${srcdir}/${_dir}"
  mkdir -p build && cd build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr"
}

build() {
  cd "${srcdir}/${_dir}/build"
  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make --silent DESTDIR="${pkgdir}/" install
}
