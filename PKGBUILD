# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>

pkgname=libsigrok-git
_pkgname=libsigrok
pkgver=3386.1e76596
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, core library (git version)"
arch=('i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrok"
license=('GPL3')
depends=('libzip' 'libftdi-compat' 'alsa-lib' 'libserialport-git' 'glibmm')
makedepends=('git' 'autoconf-archive')
provides=('libsigrok')
conflicts=('libsigrok')
source=("git://sigrok.org/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr --disable-java --disable-python

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
