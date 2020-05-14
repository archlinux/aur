# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='ngs-lang'
pkgver='0.2.7'
pkgrel=2
pkgdesc='Next Generation Shell (NGS)'
arch=('x86_64')
url='https://github.com/ngs-lang/ngs'
provides=('ngs')
license=('GPL3')
depends=('json-c'
         'gc'
         'libffi'
         'pcre')
makedepends=('cmake'
             'git'
             'pandoc'
             'peg'
             'uthash')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('edc842fcf8ced6ff9ef8ddfe6470ac4f94b7ba79415c41d5ed7a4fc93339f2f2')

prepare() {
  cd "${pkgname/-lang}-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "${pkgname/-lang}-${pkgver}/build"
  make
}

check() {
  cd "${pkgname/-lang}-${pkgver}/build"
  ctest
}

package() {
  cd "${pkgname/-lang}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  cd "${pkgdir}/usr"
  install -d share
  rm -rf doc
  mv man share/
}
# vim: ts=2 sw=2 et: