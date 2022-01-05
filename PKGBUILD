# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=linthesia-git
_pkgname=linthesia
epoch=1
pkgver=r147.427de90
pkgrel=1
pkgdesc="A game of playing music. A fork of Synthesia (git)"
arch=('i686' 'x86_64')
url="https://github.com/mans17/linthesia"
license=('GPL2')
depends=('gtkmm' 'gconfmm' 'gtkglextmm' 'alsa-lib' 'fluidsynth')
makedepends=('git')
conflicts=('linthesia')
options=(debug !strip)
#source=("linthesia::git+https://github.com/mans17/linthesia.git")
source=("linthesia::git+https://github.com/rikmg/linthesia.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make GRAPHDIR="/usr/share/linthesia/graphics"
}

package () {
	cd "$srcdir/${_pkgname}"
	make DESTDIR="$pkgdir" install
	# Install desktop file
	#mkdir "$pkgdir/usr/share/applications"
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
