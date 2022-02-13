# Maintainer:  Malte Jürgens <maltejur@dismail.de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>1

pkgname=ngs-lang
pkgver=0.2.13
pkgrel=1
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
sha256sums=('7648761edb3695292d3289b91f9644c204d42269b8af697c765707ce192e45b5')

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

package() {
  cd "${pkgname/-lang}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  cd "${pkgdir}/usr"
  install -d share
  rm -rf doc
  mv man share/
  find "${pkgdir}/usr/bin" -type f -exec chmod o-w {} +
}
# vim: ts=2 sw=2 et:
