# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Author: Jiahua Huang <jhuangjiahua@gmail.com>
# Contributor: Yangtse <yangtsesu@gmail.com>

pkgname=ibus-googlepinyin
pkgver=0.1.2
pkgrel=7
pkgdesc="IBus Wrapper for libgooglepinyin"
arch=('any')
url="https://code.google.com/archive/p/libgooglepinyin/"
license=('APACHE')
optdepends=('opencc: for simplified chinese translation to tranditional chinese')
depends=('libgooglepinyin' 'ibus' 'iso-codes' 'pygtk')
makedepends=('cmake')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/libgooglepinyin/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('0180bd93bed03ef38e283a589fcab3074f0d9197c41e1411d015de8e30ce6cbd72c6765142a42b55227fccc111cc579830b1ad9f4c282f7ac856dd66f58293e7')

prepare() {
  sed -e 's/zhs2zht.ini/s2t.json/' -i $pkgname/libopencc.py
  find $pkgname -type f -name '*.py' -exec sed -i 's|/usr/bin/python|/usr/bin/python2|g' {} \;

  rm -rf build
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../$pkgname
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
