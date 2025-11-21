# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=crycco
pkgver=0.5.0
pkgrel=1
pkgdesc="A literate programming tool"
arch=('x86_64' 'aarch64')
url="https://crycco.ralsina.me"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aea45081d970f3bb5c974a3ede81efbdb724d704129ec823d6e9fab6cf95d5e1')

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
