# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=fasda
pkgver=0.1.3
pkgrel=1
pkgdesc=" Fast And Simple Differential Analysis of transcriptomic data"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/fasda"
license=('BSD-2')
depends=('biolibc' 'libxtend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1e1fb36327b63c53cd4286dbd6edfd89cf2bdc0899fe8d8b748b01fbb1d91d47')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|${PREFIX}/libexec/fasda|${PREFIX}/lib/fasda|' Makefile
}

build() {
  cd "$pkgname-$pkgver"
  export VERSION=${pkgver}
  make clean depend
  make PREFIX="/usr"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=$pkgdir PREFIX=/usr MANPREFIX=/usr/share install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
