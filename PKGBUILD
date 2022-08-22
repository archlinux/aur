# Maintainer: notdixon <notdixon at gmx dot com>

pkgname=conceal-desktop
pkgver=6.6.5
pkgrel=1
pkgdesc="Conceal GUI (release version)"
arch=('any')
url="https://github.com/ConcealNetwork/conceal-desktop"
license=('MIT')
depends=('boost' 'boost-libs' 'qt5-base')
makedepends=('make' 'gcc' 'cmake' 'python' 'boost' 'boost-libs' 'qt5-base')
source=("https://github.com/ConcealNetwork/$pkgname/archive/refs/tags/$pkgver.tar.gz"
	"https://patch-diff.githubusercontent.com/raw/ConcealNetwork/conceal-core/pull/303.diff")
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf cryptonote
	git clone https://github.com/ConcealNetwork/conceal-core cryptonote
	cd cryptonote
	
	git checkout 6.6.5	
	patch --forward --strip=1 --input="${srcdir}/303.diff"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build-release
}

package() {
	mkdir -p $pkgdir/usr/local/bin
	cp "$srcdir/$pkgname-$pkgver/build/release/conceal-desktop" "$pkgdir/usr/local/bin/"
}
