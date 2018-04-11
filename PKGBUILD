# Maintainer: Alastair Pharo <asppsa at gmail dot com>

pkgname=pure-ffi
pkgver=0.15
pkgrel=1
pkgdesc="An interface to libffi which enables you to call C functions from Pure and vice versa."
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'libffi')
makedepends=()
groups=(pure-complete pure-util)
source=("https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('36a147d2a9641836eefccdec2c7ce51985650702')

build() {
  cd $srcdir/$pkgname-$pkgver
  export C_INCLUDE_PATH=`pacman -Ql libffi | awk '/.*\/include\/.*/ {print $2}' | head -1` && make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
