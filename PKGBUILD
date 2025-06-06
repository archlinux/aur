# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=crycco
pkgver=0.4.0
pkgrel=1
pkgdesc="A literate programming tool"
arch=('x86_64' 'aarch64')
url="https://crycco.ralsina.me"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a8e3215c5ee1544b0d14da3843f25bc078f9d4d8a5e169bf28de2b0984cdbaa3')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	shards install
	shards build --release
        strip bin/$pkgname
}

check() {
        cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
}
