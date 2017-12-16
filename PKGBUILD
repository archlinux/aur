# Maintainer: Joseph Carta <cartakid@gmail.com>
# Contributor: Carlos Henrique Merces Moreira "chmercesmoreira" <ch.mercesmoreira@gmail.com>
pkgname=photofilmstrip
pkgver=3.3.1
pkgrel=1
pkgdesc="Create video clips from photos"
arch=('i686' 'x86_64')
url="http://www.photofilmstrip.org/en/"
license=('GPL2')
depends=('wxpython' 'python2-pillow' 'gst-python2')
optdepends=('gst-plugins-bad: additional rendering formats'
	    'gst-plugins-good: additional rendering formats'
	    'gst-plugins-ugly: additional rendering formats'
	    'gst-libav: additional rendering formats')
source=("https://sourceforge.net/projects/photostoryx/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('42fefba0fc25a5182133b63d4aa5edd8')

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
