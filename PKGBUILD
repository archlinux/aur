# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libserialport-git
_pkgname=libserialport
pkgver=293.c37c9f3
pkgrel=1
pkgdesc="A minimal, cross-platform shared library for sigrok, intended to take care of the OS-specific details when writing software that uses serial ports (git version)"
arch=('i686' 'x86_64')
url="http://sigrok.org/wiki/Libserialport"
license=('GPL3')
makedepends=('git')
provides=('libserialport')
conflicts=('libserialport')
source=("git://sigrok.org/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
