# Maintainer: cth451 <cth451@gmail.com>

pkgname=linthesia
epoch=1
pkgver=20161105
pkgrel=1
pkgdesc="A game of playing music. A fork of Synthesia"
arch=('i686' 'x86_64')
url="http://linthesia.sourceforge.net/"
license=('GPL2')
depends=('gtkmm' 'gconfmm' 'gtkglextmm' 'alsa-lib' 'fluidsynth')
makedepends=('gtkmm' 'gconfmm' 'gtkglextmm' 'alsa-lib' 'svn')
source=("linthesia::git+https://github.com/linthesia/linthesia.git#commit=32d30fb188b375f017dc121c7ae3449b37af177b")
sha256sums=('SKIP')

build() {
	cd "$srcdir/linthesia"
	./autogen.sh
	./configure --prefix=/usr
	make GRAPHDIR="/usr/share/linthesia/graphics"
}

package () {
	cd "$srcdir/linthesia"
	make DESTDIR="$pkgdir" install
	# Install desktop file
	mkdir "$pkgdir/usr/share/applications"
	install -Tm644 extra/linthesia.desktop $pkgdir/usr/share/applications/linthesia.desktop 
	# Install pixmap
	mkdir "$pkgdir/usr/share/pixmaps"
	install -Tm644 extra/linthesia.xpm $pkgdir/usr/share/pixmaps/linthesia.xpm
	# Install docs
	mkdir "$pkgdir/usr/share/doc"
	mkdir "$pkgdir/usr/share/doc/linthesia"
	install -Tm644 README $pkgdir/usr/share/doc/linthesia/README
	install -Tm644 COPYING $pkgdir/usr/share/doc/linthesia/COPYING
}
