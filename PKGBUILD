# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='ngs-lang'
pkgver='0.2.4'
pkgrel=1
pkgdesc='Next Generation Shell (NGS)'
arch=('x86_64')
url='https://github.com/ngs-lang/ngs'
license=('GPLv3')
makedepends=('cmake' 'git' 'pandoc' 'peg' 'uthash')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=("${pkgname}.tar.xz::${url}/archive/v0.2.4.tar.gz")
sha256sums=('748a4b44ddb727930ebf8d2280cb18bed7d5f63a3afbc778cca1d29ba891e4bb')

prepare() {
  cd "${pkgname/-lang}-${pkgver}"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
}

build() {
  cd "${pkgname/-lang}-${pkgver}/build"

  make
}

check() {
  cd "${pkgname/-lang}-${pkgver}/build"

  ctest

  export NGS_DIR='../lib'
  export NGS_BOOTSTRAP="${NGS_DIR}/bootstrap.ngs"
  ./ngs ../test.ngs
}

package() {
  cd "${pkgname/-lang}-${pkgver}/build"

  make install
}

# vim: ts=2 sw=2 et:
