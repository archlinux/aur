# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=hace
pkgver=1.0.0
pkgrel=1
pkgdesc="A task-launching app (think make)"
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/hace"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('27c5abce7c5498611022e584f217fcb74cd133e31e97712911823cab0c31306a')

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
