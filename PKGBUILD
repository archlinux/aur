# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gitin
pkgver=0.2.1
pkgrel=1
pkgdesc="Commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/$pkgname"
license=('BSD')
depends=('libgit2')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/isacikgoz/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1a94182b808e72bab32e12b6023c530e7e9a0aeecb7f0b09ca380fa29f7bfe0a')

prepare() {
	export GOPATH="$srcdir/go"
	mkdir -p "$GOPATH/src"

	if [[ ! -e "$GOPATH/src/$pkgname-$pkgver" ]]; then
		ln -s "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$pkgname-$pkgver"
	fi
}

build() {
	cd $GOPATH
	go get github.com/isacikgoz/gitin
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 $GOPATH/bin/$pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
