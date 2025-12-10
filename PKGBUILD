# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=crycco
pkgver=0.5.1
pkgrel=1
pkgdesc="A literate programming tool"
arch=('x86_64' 'aarch64')
url="https://crycco.ralsina.me"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('37b6d4e37bfb54f677298240727e98152f21db39114e25a541924ff33269a1cd')

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
