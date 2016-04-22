# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=vagga
pkgver=0.5.0
pkgrel=1
pkgdesc="A containerisation tool without daemons"
arch=('i686' 'x86_64')
url="http://vagga.readthedocs.org"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'wget')
install=vagga.install
source=("https://github.com/tailhook/vagga/archive/v$pkgver/vagga-$pkgver.tar.gz")
sha256sums=('45de7fd88dfd2f197ac0cfc677967871ffbdedc1c344313839bf2dfad446cd7a')

build() {
	cd "$pkgname-$pkgver"
	./fetch_binaries.sh
	VAGGA_VERSION="$pkgver" cargo build --release
	cp --remove-destination target/release/vagga .
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
