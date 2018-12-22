# Maintainer: Robert Hawdon <aur at robertianhawdon dot me dot uk>

_pkgname=dfshow
pkgname=${_pkgname}-git
pkgver=20181222
pkgrel=3
pkgdesc="An interactive directory/file browser written for Unix-like systems."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/roberthawdon/dfshow"
license=('GPL3')
depends=('ncurses' 'libconfig')
makedepends=('git' 'autoconf' 'automake' 'libconfig')
source=('git+https://github.com/roberthawdon/dfshow')
sha1sums=('SKIP')
options=('!buildflags' '!makeflags')

pkgver() {
  cd "${srcdir}/dfshow"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}/dfshow"
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share
  make
}

package() {
  cd "${srcdir}/dfshow"
  make DESTDIR="${pkgdir}" install
}
