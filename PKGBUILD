# Maintainer: Rekidaishi <rekidaishi at gmail>
pkgname=iroffer-dinoex
pkgver=3.32
pkgrel=6
pkgdesc="Dinoex version of iroffer."
arch=('i686' 'x86_64')
url="https://iroffer.net"
depends=('ruby' 'geoip' 'miniupnpc')
source=("https://iroffer.net/$pkgname-$pkgver.tar.gz")
sha512sums=('03d662cf7eb3093b1f050eda8777011d6e7a833dc2fcf65d29ef0294a0d6ce4e2cea273e2d4e6ee6ba2364c088890ac6338a3aa8e6477d5e2a1a990a6e4e9603')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./Configure PREFIX=/usr -curl -geoip -ruby -upnp
	sed -i '/HAVE_LINUX_SENDFILE/d' src/iroffer_config.h
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
