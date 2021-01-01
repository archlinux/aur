# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname=ngs-lang
pkgver=0.2.10
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
sha256sums=('361a36614a56bd7cb2cb0f4aa16addfefde478f9d2cbc1838eee3969262868c2')

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
