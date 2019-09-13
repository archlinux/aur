# Maintainer: Sebastian J. Bronner <waschtl@sbronner.com>

pkgname=libnsfb
pkgver=0.2.1
pkgrel=2
pkgdesc='Framebuffer abstraction library'
arch=(x86_64 i686)
url=http://www.netsurf-browser.org/projects/libnsfb/
license=(MIT)
depends=(glibc)
makedepends=(netsurf-buildsystem)
source=(http://source.netsurf-browser.org/$pkgname.git/snapshot/$pkgname-release/$pkgver.tar.bz2)
sha256sums=('6634ab873adc8bad537b30278588b34a41e67c1ecc286d5386a077747b3364a8')
_makedir=$pkgname-release/$pkgver
_makeopts="-C $_makedir PREFIX=/usr COMPONENT_TYPE=lib-shared"

build() {
	make $_makeopts
}

check() {
	make $_makeopts test
}

package() {
	local installopts='--mode 0644 -D --target-directory'
	local shrdir="$pkgdir/usr/share"
	local licdir="$shrdir/licenses/$pkgname"
	local docdir="$shrdir/doc/$pkgname"
	install $installopts "$licdir" $_makedir/COPYING
	install $installopts "$docdir" $_makedir/{README,usage}
	make $_makeopts DESTDIR="$pkgdir" install
}
