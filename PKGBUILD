# Maintainer: Joseph Carta <cartakid@gmail.com>
# Contributor: Carlos Henrique Merces Moreira "chmercesmoreira" <ch.mercesmoreira@gmail.com>
pkgname=photofilmstrip
pkgver=4.0.0
pkgrel=1
pkgdesc="Create video clips from photos"
arch=('i686' 'x86_64')
url="http://www.photofilmstrip.org/en/"
license=('GPL2')
depends=('python' 'python-pillow' 'python-wxpython' 'python-sphinx' 'gst-python')
optdepends=('gst-plugins-bad: additional rendering formats'
	    'gst-plugins-good: additional rendering formats'
	    'gst-plugins-ugly: additional rendering formats'
	    'gst-libav: additional rendering formats'
		'python-cairo: slideshow preview')
source=("https://github.com/PhotoFilmStrip/PFS/archive/v$pkgver.tar.gz")
md5sums=('5781cb009ac50c0b2538fdd2dcf354be')

build() {
	cd "$srcdir/PFS-$pkgver"
	python setup.py build
}

package () {
	cd "$srcdir/PFS-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1

	chmod 644 "$pkgdir/usr/share/applications/photofilmstrip.desktop"
	find "$pkgdir/usr/share/doc/photofilmstrip/" -type f -exec chmod 644 {} \;
	
	for size in 32x32 48x48 64x64 192x192
	do
		chmod 644 "$pkgdir/usr/share/icons/hicolor/$size/apps/photofilmstrip.png"
	done
}
