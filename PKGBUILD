# Maintainer: Joseph Carta <cartakid@gmail.com>
# Contributor: Carlos Henrique Merces Moreira "chmercesmoreira" <ch.mercesmoreira@gmail.com>
pkgname=photofilmstrip
pkgver=3.7.2
pkgrel=2
pkgdesc="Create video clips from photos"
arch=('i686' 'x86_64')
url="http://www.photofilmstrip.org/en/"
license=('GPL2')
depends=('python37' 'python37-pillow' 'python37-wxpython' 'python37-gobject' 'python37-six' 'gst-python')
optdepends=('gst-plugins-bad: additional rendering formats'
	    'gst-plugins-good: additional rendering formats'
	    'gst-plugins-ugly: additional rendering formats'
	    'gst-libav: additional rendering formats')
source=("https://github.com/PhotoFilmStrip/PFS/archive/v$pkgver.tar.gz")
md5sums=('a7b4362b9eb8ede7a4ee99f0165f383a')

build() {
	cd "$srcdir/PFS-$pkgver"
	python3.7 setup.py build
}

package () {
	cd "$srcdir/PFS-$pkgver"
	python3.7 setup.py install --root="$pkgdir" --optimize=1

	chmod 644 "$pkgdir/usr/share/applications/photofilmstrip.desktop"
	mkdir "$pkgdir"/usr/share/doc/photofilmstrip/html
	cp -r ../../*.html "$pkgdir"/usr/share/doc/photofilmstrip/html
	find "$pkgdir/usr/share/doc/photofilmstrip/" -type f -exec chmod 644 {} \;
	
	for size in 32x32 48x48 64x64 192x192
	do
		chmod 644 "$pkgdir/usr/share/icons/hicolor/$size/apps/photofilmstrip.png"
	done
}
