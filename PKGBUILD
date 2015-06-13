# Maintainer: Alastair Pharo <asppsa at gmail dot com>

pkgname=pure-ffi
pkgver=0.14
pkgrel=1
pkgdesc="An interface to libffi which enables you to call C functions from Pure and vice versa."
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'libffi')
makedepends=()
groups=(pure-complete pure-util)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('65a217e7950ac38f8633bb9bbb58903c541bfa29')

build() {
  cd $srcdir/$pkgname-$pkgver
  export C_INCLUDE_PATH=`pacman -Ql libffi | awk '/.*\/include\/.*/ {print $2}' | head -1` && make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
