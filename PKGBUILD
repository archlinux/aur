# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=grafito
pkgver=1.3.2
pkgrel=1
pkgdesc="A linux logs web frontend"
arch=('x86_64' 'aarch64')
url="https://grafito.ralsina.me"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz" "grafito.service")
sha256sums=('aec21ee9ebb55f7790cd79bfc9fa22bbf3f1da70b0a00a1951c5a1ae0705338a'
            '811bf1c965009017d9dfc3d6a3a62018fce8c5343ba4a37aa71c248ac255815b')

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
	install -Dm644 "$pkgname.service" "$pkgdir/etc/systemd/system/$pkgname.service"
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
