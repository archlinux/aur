# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=grafito
pkgver=0.16.1
pkgrel=1
pkgdesc="A linux logs web frontend"
arch=('x86_64' 'aarch64')
url="https://grafito.ralsina.me"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz" "grafito.service")
sha256sums=('af835319aacd4e87ca129dcd003d3d90d1ca102b735f0c2ddcd42d15cc6ff538'
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
