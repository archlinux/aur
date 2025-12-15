# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=hace
pkgver=0.8.0
pkgrel=1
pkgdesc="A task-launching app (think make)"
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/hace"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('01fc232865fcf722854d461357e07dbd369bd187f91f9fe6bc65573f0a31d6b5')

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
	install -Dm755 bin/${pkgname} $pkgdir/usr/bin/${pkgname}
}
