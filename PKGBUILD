# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=crycco
pkgver=0.3.2
pkgrel=1
pkgdesc="A literate programming tool"
arch=('x86_64' 'aarch64')
url="https://crycco.ralsina.me"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9b63ec0cd9e451a40340027d097a2a3b118f0b6df1bf03b31e49d91509cf5ae')

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
