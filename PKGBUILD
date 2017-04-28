# Maintainer: Bruno Nova <brunomb.nova@gmail.com>
pkgname=drmips
pkgver=2.0.2
pkgrel=1
pkgdesc="Graphical MIPS simulator to support computer architecture teaching and learning"
arch=('any')
url="http://brunonova.github.io/$pkgname/"
license=('GPL3')
depends=('java-runtime>=7' 'desktop-file-utils' 'hicolor-icon-theme' 'ttf-font')
makedepends=('java-environment>=7' 'cmake>=2.8')
install="$pkgname.install"
source=("https://github.com/brunonova/$pkgname/releases/download/v$pkgver/DrMIPS_v$pkgver.tar.xz")
md5sums=('3a06e513f2f74716313c0a90d85a4790')

build() {
	cd "$srcdir"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DDRMIPS_BUILD_TESTS=off
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
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "NEWS" "$pkgdir/usr/share/doc/$pkgname/NEWS"
	install -Dm644 "AUTHORS" "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
}
