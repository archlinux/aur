# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: bjoern lindig <bjoern dot lindig at googlemail dot com>

pkgname=pure-gen
pkgver=0.23
pkgrel=1
pkgdesc="A C interface generator for Pure"
arch=("i686" "x86_64")
license=('custom')
url="https://agraef.github.io/pure-lang/"
depends=('pure')
makedepends=('ghc' 'ghc-static' 'ghc-pristine' 'cabal-install' 'alex' 'happy')
groups=(pure-complete pure-util)
source=("https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('205d18ee7fff502f90b0fa741eabb52c8c5fd72b')

build() {
	cd $srcdir/$pkgname-$pkgver
	export PATH=/usr/share/ghc-pristine/bin:$PATH
	make PUREC_FLAGS=-mcpu=generic maintainer-build
}

check() {
	cd $srcdir/$pkgname-$pkgver
	make check
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
