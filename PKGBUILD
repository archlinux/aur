# Maintainer: Carlos Henrique Merces Moreira "chmercesmoreira" <ch.mercesmoreira@gmail.com>
pkgname=photofilmstrip
pkgver=3.0.1
pkgrel=1
pkgdesc="Create video clips from photos"
arch=('i686' 'x86_64')
url="http://www.photofilmstrip.org/1-0-Home.html"
license=('GPL2')
depends=('wxpython' 'python2-pillow' 'gst-python2')
optdepends=('gst-plugins-bad: additional rendering formats'
	    'gst-plugins-good: additional rendering formats'
	    'gst-plugins-ugly: additional rendering formats'
	    'gst-libav: additional rendering formats')
source=("https://sourceforge.net/projects/photostoryx/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('611bb2051d8d6d40664c57181f949a78')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2.7 setup.py build
}

package () {
	cd "$srcdir/$pkgname-$pkgver"
	python2.7 setup.py install --root="$pkgdir" --optimize=1

	chmod 644 "$pkgdir/usr/share/applications/photofilmstrip.desktop"

	find "$pkgdir/usr/share/doc/photofilmstrip/" -type f -exec chmod 644 {} \;
	
	for size in 32x32 48x48 64x64 192x192
	do
		chmod 644 "$pkgdir/usr/share/icons/hicolor/$size/apps/photofilmstrip.png"
	done
}
