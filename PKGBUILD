# Maintainer: Marco Pompili <aur (at) mg.odd.red>

pkgname=autowiring
pkgver=1.1.0
pkgrel=1
pkgdesc="An IoC framework for C++11. It provides a declarative way to manage resources through dependency injection."
arch=('i686' 'x86_64')
url="https://github.com/leapmotion/autowiring"
license=('Apache')
makedepends=('cmake' 'gcc7')
source=("https://github.com/leapmotion/autowiring/archive/v${pkgver}.tar.gz")
sha256sums=('480e4af5f0d56900a809afeee9a5dd1129c1cbc8c502d653f6b543ce6038c468')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./scripts/whitespace_check.sh
  ./scripts/copyright_check.sh
  ./scripts/version_number_updated.sh

  mkdir -p build
  cd build

  cmake .. \
  -DCMAKE_C_COMPILER=/usr/bin/gcc-7 \
  -DCMAKE_CXX_COMPILER=/usr/bin/g++-7 \
	-DCMAKE_BUILD_TYPE=Debug \
	-DCMAKE_INSTALL_PREFIX:PATH=${pkgdir} \
	# -DCMAKE_CXX_FLAGS_RELEASE=-Werror
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  ctest --output-on-failure --timeout 30
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
