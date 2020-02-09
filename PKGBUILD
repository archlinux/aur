# Maintainer: Joseph Carta <cartakid@gmail.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=photofilmstrip-git
pkgver=r658.ed795e7
pkgrel=1
pkgdesc="Create video clips from photos"
arch=('i686' 'x86_64')
url="http://www.photofilmstrip.org/en/"
license=('GPL2')
depends=('python' 'python-wxpython' 'python-pillow' 'gst-python'
         'gst-editing-services' 'python-sphinx')
optdepends=('gst-plugins-bad: additional rendering formats'
	        'gst-plugins-good: additional rendering formats'
	        'gst-plugins-ugly: additional rendering formats'
	        'gst-libav: additional rendering formats'
            'python-cairo: slideshow preview')
_pkgname=PFS
provides=('photofilmstrip')
conflicts=('photofilmstrip')
source=("git+https://github.com/PhotoFilmStrip/PFS")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package () {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir" --optimize=1

	chmod 644 "$pkgdir/usr/share/applications/photofilmstrip.desktop"

	find "$pkgdir/usr/share/doc/photofilmstrip/" -type f -exec chmod 644 {} \;

	for size in 32x32 48x48 64x64 192x192
	do
		chmod 644 "$pkgdir/usr/share/icons/hicolor/$size/apps/photofilmstrip.png"
	done
}
