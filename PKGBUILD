# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=soundconverter-py3k-git
pkgver=3.0.0.alpha1.7.g34895a6
pkgrel=1
pkgdesc="A simple sound converter application for GNOME using python 3 and GTK+3 branch"
arch=('any')
url="http://soundconverter.org/"
license=('GPL3')
depends=('pygtk' 'gst-python' 'gst-plugins-ugly' 'desktop-file-utils' 'gst-plugins-good')
makedepends=('git' 'intltool' 'gnome-common')
provides=('soundconverter')
conflicts=('soundconverter')
install=soundconverter.install
source=("git+https://github.com/kassoulet/soundconverter.git#branch=py3k")
md5sums=('SKIP')
_gitname="soundconverter"

pkgver() {
	cd "$srcdir"/"$_gitname"
	git describe --tags | sed 's|-|.|g'
}

build() {
	cd "$srcdir"/"$_gitname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
}
