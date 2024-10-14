# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=markterm
pkgver=0.5.2
pkgrel=1
pkgdesc="A terminal markdown renderer."
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/markterm"
license=('MIT')
makedepends=('crystal' 'shards')
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
optdepends=("timg: image support")
sha256sums=("1486463a95194516f438a358ef63bd2d1a270160dc6fe2167c2152c82e219634")

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	shards install --without-development
	shards build --release --without-development
}

check() {
        cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
}
