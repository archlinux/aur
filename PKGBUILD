# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=fasda
pkgver=0.1.4
pkgrel=2
pkgdesc=" Fast And Simple Differential Analysis of transcriptomic data"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/fasda"
license=('BSD-2')
depends=('biolibc' 'libxtend' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8e1b1536ff3c551c16b6ddca543378343e055a9b067ef5038e2b2f1fb2e874b9')

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
