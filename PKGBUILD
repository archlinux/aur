# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>

_name='calcurse'
pkgname="${_name}-git"
pkgver=4.0.0.1488.41b3ab7
pkgrel=1
pkgdesc='A text-based personal organizer (Git version).'
arch=('i686' 'x86_64')
url='http://git.calcurse.org/calcurse.git'
license=('BSD')
depends=('ncurses')
makedepends=('git' 'asciidoc')
provides=('calcurse')
conflicts=('calcurse')
source=("${_name}::${url//http/git}")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/${_name}"
   echo "$(git describe HEAD|cut -d 'v' -f2|cut -d '-' -f1).$(git rev-list --count HEAD).$(git log -1 --pretty=format:%h )"
}

build() {
   cd "${srcdir}/${_name}"
   ./autogen.sh
   ./configure --prefix=/usr --mandir=/usr/share/man
   make
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}" install
} 
