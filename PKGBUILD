# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=tartrazine
pkgver=0.27.0
pkgrel=1
pkgdesc="A syntax highlighting tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/tartrazine"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3316ca0e65369795216e716ca8027302d8c0774c5e7f95760abdaf258d370b2a')

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
