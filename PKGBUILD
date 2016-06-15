# Maintainer: Carlos Henrique Merces Moreira "chmercesmoreira" <ch.mercesmoreira@gmail.com>
pkgname=photofilmstrip
pkgver=2.1.0
pkgrel=6
pkgdesc="Create video clips from photos"
arch=('i686' 'x86_64')
url="http://www.photofilmstrip.org/1-0-Home.html"
license=('GPL2')
depends=('wxpython' 'python2-imaging' 'mencoder' 'gstreamer0.10-python')
source=("https://sourceforge.net/projects/photostoryx/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('0488f7b9cf8f99cff5b161c1911d9588')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2.7 setup.py build
}

package () {
	cd "$srcdir/$pkgname-$pkgver"
	python2.7 setup.py install --root="$pkgdir" --optimize=1

	chmod 644 $pkgdir/usr/share/applications/photofilmstrip.desktop

	find $pkgdir/usr/share/doc/photofilmstrip/ -type f -exec chmod 644 {} \;
	
	for size in 32x32 48x48 64x64 192x192
	do
		chmod 644 $pkgdir/usr/share/icons/hicolor/$size/apps/photofilmstrip.png
	done
}
