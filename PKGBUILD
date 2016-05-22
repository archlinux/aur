# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=diffutils-git
pkgver=3.3.r46.g5a48551
pkgrel=1
pkgdesc='Utility programs used for creating patch files'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/diffutils'
license=('GPL3')
provides=('diffutils')
conflicts=('diffutils')
source=("${pkgname}::git+git://git.savannah.gnu.org/diffutils.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  msg 'Bootstrapping diffutils ...'
  ./bootstrap
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:	
