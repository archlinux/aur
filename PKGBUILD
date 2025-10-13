# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>

pkgname=searchmonkey-gtk
_pkgname=searchmonkey
pkgver=0.8.3
pkgrel=2
pkgdesc="A powerful GUI search utility for matching regex patterns, GTK version"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/searchmonkey/"
license=('GPL3')
depends=('gtk2' 'intltool' 'libzip' 'poppler-glib')
source=("https://sourceforge.net/projects/${_pkgname}/files/gSearchmonkey%20GTK%20%28Gnome%29/${pkgver}%20%5Bstable%5D/${_pkgname}-${pkgver}.tar.gz"
	"build.patch")
md5sums=('abb2247e67cc0fa5f8a9bee13c531625' 'f4f6f7dab591544401d3b7544967610d')

prepare() {
    cd $_pkgname-$pkgver
    patch -Np1 -i ../build.patch
}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  CFLAGS=-Wno-error ./configure
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
