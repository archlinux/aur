# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=tartrazine
pkgver=0.20.0
pkgrel=1
pkgdesc="A syntax highlighting tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/tartrazine"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('48009f9b812cc8a71f325b6f5f7cdccbe60e7545491e3f3945c62becc19809ec')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	shards install
	shards build --release
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
