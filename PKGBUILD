# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=crycco
pkgver=0.5.2
pkgrel=1
pkgdesc="A literate programming tool"
arch=('x86_64' 'aarch64')
url="https://crycco.ralsina.me"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6acc4699117c98675d996b4588b9d1e47ec299feef2c65b9072ad46f4701f7a1')

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
