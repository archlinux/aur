# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=tartrazine
pkgver=0.26.2
pkgrel=1
pkgdesc="A syntax highlighting tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/tartrazine"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0855f04ba3d89f383e2ff7f2c81176764175de0a823834c1757f6540387911f')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	shards install
	shards build --release -Dhansa
        strip bin/tartrazine
}

check() {
        cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 bin/tartrazine $pkgdir/usr/bin/tartrazine
}
