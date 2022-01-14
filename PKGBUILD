pkgname=soundconverter-git
pkgver=4.0.3+12+gf1611d6
pkgrel=1
pkgdesc="A simple sound converter application for GNOME"
arch=('any')
url="http://soundconverter.org/"
license=('GPL3')
depends=('python-gobject' 'gst-python' 'gst-plugins-ugly' 'gst-plugins-good')
makedepends=('git' 'python-distutils-extra')
provides=('soundconverter')
conflicts=('soundconverter')
source=("git+https://github.com/kassoulet/soundconverter.git")
md5sums=('SKIP')
_gitname="soundconverter"

pkgver() {
	cd "$srcdir"/"$_gitname"
	git describe --tags | sed 's/-/+/g'
}

build() {
	cd "$srcdir"/"$_gitname"
	python setup.py build
}

package() {
	cd "$srcdir/$_gitname"
	python setup.py install --prefix="$pkgdir/usr"
	rm "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
