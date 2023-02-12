# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=fasda
pkgver=0.1.2
pkgrel=1
pkgdesc=" Fast And Simple Differential Analysis of transcriptomic data"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/fasda"
license=('BSD-2')
depends=('biolibc' 'libxtend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ea6003795b462286d4b7ea11924f424cdea418a345ceeccd1a04d679edf2374e')

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
