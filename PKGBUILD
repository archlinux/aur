# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gitin
pkgver=0.1.5
pkgrel=1
pkgdesc="Commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/$pkgname"
license=('BSD')
depends=('openssl')
makedepends=('go' 'git' 'libgit2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/isacikgoz/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('997b2f75487fa1590eeb0191e72e7e70b576e796f8b35ded1846771f445d2d6a')

prepare() {
	export GOPATH="$srcdir/go"
	mkdir -p "$GOPATH/src"

	if [[ ! -e "$GOPATH/src/$pkgname-$pkgver" ]]; then
		ln -s "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$pkgname-$pkgver"
	fi
}

build() {
	export GOPATH="$srcdir/go"
	cd "$GOPATH/src/$pkgname-$pkgver"
	go get
	go build
}

package() {
	cd $pkgname-$pkgver
	install -m755 -D $pkgname-$pkgver $pkgdir/usr/bin/$pkgname
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
