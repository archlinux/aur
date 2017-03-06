# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: neodreams <yanbrodeur@videotron.ca>

pkgname=gnome-specimen
pkgver=0.4
pkgrel=6
pkgdesc="A simple tool to view and compare fonts installed on your system."
arch=('any')
url="https://download.gnome.org/sources/gnome-specimen"
license=('GPL')
depends=('python2-gconf')
makedepends=('intltool')
source=("$url/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('353ef10e647e5d06354dd827a4152a8cb45bf56b2f1c72e449a41e5175880424')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # GtkSpinButton fix
  sed -i "s_1\(0<\)_\1_" data/$pkgname.glade

  # Removing unneeded gnome code
  sed -i "41,45d;59,60d" specimen/main.py

  export PYTHON="/usr/bin/python2"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
