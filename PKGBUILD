# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=floyd
pkgver=2.0.1
pkgrel=5
pkgdesc="displays system load with pulse of keyboard LED"
arch=('x86_64')
url="http://www.asahi-net.or.jp/~pi9s-nnb/floyd/"
license=("GPL")
depends=()
source=(http://www.asahi-net.or.jp/~pi9s-nnb/floyd/$pkgname-$pkgver.tar.gz
	build-fix.patch)
md5sums=('c1b80bc76ac4e25e821a193428fa42a4'
         '0cde2017ead790f9d556ef34c6a4008f')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 <"$srcdir"/build-fix.patch
  make pthread
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/share/man/man1 "$pkgdir"/usr/bin
  make install MANDIR="$pkgdir"/usr/share/man/man1 BINDIR="$pkgdir"/usr/bin
}
