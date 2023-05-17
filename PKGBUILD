# Maintainer:  Malte Jürgens <maltejur@dismail.de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>1

pkgname=ngs-lang
pkgver=0.2.16
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
sha256sums=('282bcd00164044a01b025b5373ed2e0b03d6e5b3d04cea2f363629a7ea5b92c7')

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
