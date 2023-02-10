# Maintainer: éclairevoyant
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: Moritz Lüdecke <ritze at skweez dot net>
# Contributor: boenki <boenki at gmx dot de>

pkgname=cover-thumbnailer
pkgver=0.10.0
pkgrel=2
pkgdesc="Python-based thumbnailer that supports album covers and picture folders"
arch=('any')
url="https://github.com/flozz/$pkgname"
license=('GPL3')
depends=('python-pillow')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dc54c9308e2b6b7d4c182b2bacfa7b46bb4bedc486565f5285e0e2a1772f52e4')
install="$pkgname.install"

package() {
	cd $pkgname-$pkgver
	install -Dm755 $pkgname.py "$pkgdir/usr/bin/$pkgname"
	install -Dm755 $pkgname-gui.py  "$pkgdir/usr/bin/$pkgname-gui"
	install -Dm644 share/* -t "$pkgdir/usr/share/$pkgname/"
	install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find locale -name '*.po' -print | while read -r f; do
		_targetdir="$pkgdir/usr/share/locale/$(basename $f .po)/LC_MESSAGES/"
		install -dm755 "$_targetdir"
		msgfmt $f -o "$_targetdir/$pkgname-gui.mo"
	done
	install -Dm644 freedesktop/$pkgname-gui.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 freedesktop/cover.thumbnailer -t "$pkgdir/usr/share/thumbnailers/"
}
