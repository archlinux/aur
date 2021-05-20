# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

_gitname=libserialport
pkgname="${_gitname}-git"
pkgver=r396.1b01106
pkgrel=1
pkgdesc="A minimal, cross-platform shared library for sigrok, intended to take care of the OS-specific details when writing software that uses serial ports (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://sigrok.org/wiki/Libserialport"
license=('GPL3')
makedepends=('git')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("git://sigrok.org/${_gitname}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
