# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: beest <gnubeest@gmail.com>

pkgname=duc
pkgver=1.4.6
pkgrel=1
pkgdesc="A library and suite of tools for inspecting disk usage."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://duc.zevv.nl/"
license=('LGPL-3.0-only')
depends=('cairo' 'pango' 'leveldb' 'ncurses' 'libx11' 'glib2' 'glibc')
makedepends=('pkgconf')
source=("https://github.com/zevv/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
validpgpkeys=(F042F5CDB0A6EC6ACB80A829CACDA4B54202FA2F)
sha512sums=('4d866a8bcd3d6659354f7d12d65e89c28f3fa670625cf391cbc005db0a09c62daf6e374acfac3f53c73f8f69c6b910606ce04c8c6d370824aa254adce73ffa17')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-db-backend=leveldb
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
