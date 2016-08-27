# Maintainer: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>

pkgname=alienfx-lite
pkgver=1.1
pkgrel=1
pkgdesc="A keyboard color management tool for Alienware laptops (written in Java with a C++ native library)"
arch=('i686' 'x86_64')
url="https://github.com/bchretien/AlienFxLite"
license=('GPL')
depends=('java-runtime' 'jdk8-openjdk' 'libusb')
makedepends=('cmake')
source=("https://github.com/bchretien/AlienFxLite/archive/v${pkgver}.tar.gz")
sha256sums=('b1fe13e9f52f85894e2de8ead3532ebbc6c345b4e17c872979988f8b24d4ff8f')

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
