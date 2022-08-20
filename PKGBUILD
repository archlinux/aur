# Maintainer: notdixon <notdixon at gmx dot com>

pkgname=conceal-core
pkgver=6.6.5
pkgrel=1
pkgdesc="Conceal CLI (release version)"
arch=('any')
url="https://github.com/ConcealNetwork/conceal-core"
license=('MIT')
depends=('boost' 'boost-libs')
makedepends=('make' 'gcc' 'cmake' 'python' 'boost' 'boost-libs')
source=("https://github.com/ConcealNetwork/$pkgname/archive/refs/tags/$pkgver.tar.gz"
	"https://patch-diff.githubusercontent.com/raw/ConcealNetwork/conceal-core/pull/303.diff")
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/303.diff"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir build || true
	cd "build"
	cmake ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build/src"
	mkdir -p $pkgdir/usr/local/bin
	cp concealwallet conceald optimizer walletd $pkgdir/usr/local/bin/
}
