# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=tartrazine
pkgver=0.11.0
pkgrel=1
pkgdesc="A syntax highlighting tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/tartrazine"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c8b0d0377082cf2213f5ece91af360734bb16ea02ba73c11f61e0bfd0428782')

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
