pkgname=soundconverter-git
pkgver=3.0.0+beta1+1+g9919e80
pkgrel=1
pkgdesc="A simple sound converter application for GNOME"
arch=('any')
url="http://soundconverter.org/"
license=('GPL3')
depends=('python-gobject' 'gst-python' 'gst-plugins-ugly' 'desktop-file-utils' 'gst-plugins-good')
makedepends=('git')
provides=('soundconverter')
conflicts=('soundconverter')
source=("git+https://github.com/kassoulet/soundconverter.git")
md5sums=('SKIP')
_gitname="soundconverter"

pkgver() {
	cd "$srcdir"/"$_gitname"
	git describe --tags | sed 's/-/+/g'
}

prepare() {
	cd "$srcdir"/"$_gitname"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$srcdir"/"$_gitname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
}
