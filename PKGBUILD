# Maintainer: Qiaoyong Zhong <solary.sh@gmail.com>
pkgname=2048-qt
_pkgname=2048-Qt
pkgver=0.1.6
pkgrel=1
pkgdesc="The 2048 number game implemented in Qt"
arch=('i686' 'x86_64')
url="https://github.com/xiaoyong/2048-Qt"
license=('MIT')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'hicolor-icon-theme' 'desktop-file-utils' 'xdg-utils')
install=$pkgname.install
source=(https://github.com/xiaoyong/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('cca8ebf496c70a2c1a56fbe9e893062b')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	qmake $pkgname.pro
	make
}

check() {
	cd "$srcdir/$_pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"

	# Install icons
	sizes=(16 32 48 256)
	for size in ${sizes[@]}; do
		install -D -m644 res/icons/${size}x${size}/apps/$pkgname.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
	done
	install -D -m644 res/icons/scalable/apps/$pkgname.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 res/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -D -m644 Changelog.md "$pkgdir/usr/share/doc/$pkgname/Changelog.md"
	# Man page
	install -D -m644 res/man/$pkgname.6 "$pkgdir/usr/share/man/man6/$pkgname.6"
	gzip "$pkgdir/usr/share/man/man6/$pkgname.6"
}
