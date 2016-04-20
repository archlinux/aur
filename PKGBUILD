# Maintainer: Alex O'Neill <oneill.alexander.b@gmail.com>
_pkgname=spice-gtk
pkgname=${_pkgname}2
pkgver=0.31
pkgrel=1
pkgdesc="Open source solution for remote access to virtual machines"
arch=( 'i686' 'x86_64' )
url="http://www.spice-space.org/"
license=('LGPL2.1')
depends=( 'gtk2' 'gtk-doc' 'spice-protocol-git' 'python2' )
makedepends=( 'git' 'intltool' )
provides=("$pkgname")
conflicts=("$pkgname" "${_pkgname}3" "spice-glib" )
source=("http://www.spice-space.org/download/gtk/spice-gtk-LATEST.tar.bz2")
sha256sums=('c72b4d202b1c0b71d6e24ce5caf914d6dddbcf4010d10db9c2d8e73af728c1ca')

pkgver() {
  cd "$srcdir"
  find . -maxdepth 1 -type d \
    | grep $_pkgname \
    | sed -e "s/\.\/$_pkgname-//g"
}

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr --with-gtk=2.0
	make
}

check() {
	cd "$_pkgname-$pkgver"
	make -k check
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
