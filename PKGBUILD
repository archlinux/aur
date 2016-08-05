# Maintainer: joel <aullidolunar at gmai1 d0t c0m>

_pkgname=libnotifymm
pkgname=$_pkgname-gtk2
pkgver=0.7.0
pkgrel=1
pkgdesc="C++ wrappers for libnotify (gtk2 version)"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gtkmm' 'libnotify>=0.7.5')
makedepends=('mm-common')
provides=(${_pkgname})
conflicts=(${_pkgname})
replace=(${_pkgname})
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/0.7/$_pkgname-$pkgver.tar.xz)
url="http://www.gnome.org/"
sha256sums=('bfe4b4411265d5bf437408735a37b6ad8e4da772eec1e2aa18792745e6a60954')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	# patch for gtkmm-2.4
	sed -i '52s/gtkmm-3.0 >= 3.4.1/gtkmm-2.4/' configure.ac
	# regenerate configure script
	autoreconf -fi
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
