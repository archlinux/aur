# Maintainer: Juri Vitali <juri@dividebyzero.it>
pkgname=vlc-bittorrent
pkgver=2.12
pkgrel=1
pkgdesc="A bittorrent plugin for VLC."
arch=(x86_64)
url="https://github.com/johang/vlc-bittorrent"
license=('GPL')
depends=(vlc libtorrent-rasterbar)
makedepends=(boost autoconf-archive)
source=("https://github.com/johang/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('48f980d77c170194fefe3606cec9da8877985a5a00f6155e888781a0563e4b10')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
# Uncomment `--with-tests` to enable tests
	./configure --prefix=/usr \
                    --libdir=/usr/lib/vlc/plugins/bittorrent #\
#	            --with-tests
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
