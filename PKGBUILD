# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nuvola-app-bandcamp-git
pkgver=2.2.r0.gf7c844a
pkgrel=1
pkgdesc="Bandcamp integration for Nuvola Player."
arch=("i686" "x86_64")
url="https://github.com/tiliado/nuvola-app-bandcamp"
license=('custom:BSD')
depends=('nuvolaplayer-git')
makedepends=('git' 'python-nuvolasdk' 'scour')
source=("${pkgname}::git+https://github.com/tiliado/nuvola-app-bandcamp.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr --with-dbus-launcher
	make all
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	make install DESTDIR="$pkgdir"
}
