# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=libsrsirc
pkgver=0.0.0
pkgrel=1
pkgdesc="An C library for IRC clients, including test application icat"
arch=('i686' 'x86_64')
url="https://github.com/srsbsns/libsrsirc"
license=('BSD')
depends=(glibc)
makedepends=(autoconf)
checkdepends=()
options=(!libtool)
source=("$pkgname-$pkgver.tar.gz::https://github.com/srsbsns/libsrsirc/tarball/bc4b200")
sha256sums=('1cb865aa6ece144a230c43b39feaf0d7da82c02032cbdf6063f40d30a5bd12aa')

_git_commit=$(echo ${source[0]} | sed 's/.*\///g')

build() {
  cd "$srcdir/srsbsns-$pkgname-$_git_commit"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/srsbsns-$pkgname-$_git_commit"
  make -k check
}

package() {
  cd "$srcdir/srsbsns-$pkgname-$_git_commit"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
