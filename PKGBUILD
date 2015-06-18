# Maintainer: Melvin Vermeeren <melvinvermeeren@gmail.com>
pkgname=openzwave-git
_gitname="open-zwave"
pkgver=r1042.ae78bcf
pkgrel=1
pkgdesc="Opensource Z-Wave control"
url="http://www.openzwave.com"
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL')
depends=('libsystemd')
makedepends=('doxygen' 'git')
conflicts=('openzwave' 'openzwave-svn')
provides=('openzwave')
source=("git://github.com/OpenZWave/open-zwave.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make DESTDIR=${pkgdir} PREFIX=/usr instlibdir=usr/lib/ sysconfdir=etc/${pkgname} install
}

# vim:set ts=2 sw=2 et:
