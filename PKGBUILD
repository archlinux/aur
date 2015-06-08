# Maintainer: Bruno Nova <brunomb.nova@gmail.com>
pkgname=drmips
pkgver=1.3.0
pkgrel=1
pkgdesc="Graphical MIPS simulator to support computer architecture teaching and learning"
arch=('any')
url="https://bitbucket.org/brunonova/drmips"
license=('GPL3')
depends=('java-runtime>=6' 'desktop-file-utils' 'hicolor-icon-theme' 'ttf-font')
makedepends=('java-environment>=6' 'cmake>=2.8')
optdepends=('drmips-doc: user manuals')
install="$pkgname.install"
changelog="ChangeLog"
source=("https://bitbucket.org/brunonova/$pkgname/downloads/DrMIPS_v$pkgver.tar.xz")
md5sums=('78378319a6dcb29c51435e8c0b051fac')

build() {
	cd "$srcdir"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DDRMIPS_BUILD_MANUALS=off
	make
}

package() {
	cd "$srcdir"
	make DESTDIR="$pkgdir" install
	for _size in 16 24 32 48 64 96 128 256 512; do
		install -Dm644 "src/pc/DrMIPS/src/res/icons/x$_size/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$pkgname.png"
	done
	install -Dm644 "misc/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "misc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 "misc/$pkgname.pt.1" "$pkgdir/usr/share/man/pt/man1/$pkgname.1"
	install -Dm644 "changelog" "$pkgdir/usr/share/doc/drmips/changelog"
}
