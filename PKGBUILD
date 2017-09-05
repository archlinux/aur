# Maintainer: John Sirett <johnsirett3@googlemail.com>
# Contributor: Shacristo <Shacristo at gmail dot com>
# Contributor: Jáchym Barvínek <jachymb@gmail.com>
pkgname=lybniz
pkgver=1.3.2
pkgrel=1
pkgdesc="An easy to use mathematical function graph plotter written in Python and GTK."
arch=(any)
url="http://lybniz2.sourceforge.net/index.html"
license=('BSD')
depends=('python2' 'pygtk')
optdepends=('gnome-python: GNOME Help Support')
source=(https://downloads.sourceforge.net/project/${pkgname}2/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('0effc8eba87cfa3514ec54157e7f9815')

build() {
	cd "$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1

	# Change executable file name on disk
	mv "$pkgdir/usr/bin/lybniz.py" "$pkgdir/usr/bin/lybniz"
	sed -i -e 's/Exec=lybniz.py/Exec=lybniz/' "$pkgdir/usr/share/applications/lybniz.desktop"

	# Install license
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et: