# Maintainer: Bruno Nova <brunomb.nova@gmail.com>
pkgname=drmips
pkgver=1.3.1
pkgrel=2
pkgdesc="Graphical MIPS simulator to support computer architecture teaching and learning"
arch=('any')
url="https://bitbucket.org/brunonova/drmips"
license=('GPL3')
depends=('java-runtime>=6' 'desktop-file-utils' 'hicolor-icon-theme' 'ttf-font')
makedepends=('java-environment>=6' 'cmake>=2.8')
optdepends=('drmips-doc: user manuals')
install="$pkgname.install"
source=("https://bitbucket.org/brunonova/$pkgname/downloads/DrMIPS_v$pkgver.tar.xz")
md5sums=('b119bbaf57cbd038f207756163aecf42')

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
