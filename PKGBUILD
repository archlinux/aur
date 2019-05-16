# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=diffutils-git
pkgver=3.7.r11.g3600e8d
pkgrel=1
pkgdesc='Utility programs used for creating patch files'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/diffutils'
license=('GPL3')
depends=('libsigsegv')
makedepends=('gperf' 'git' 'help2man' 'rsync' 'wget')
provides=('diffutils')
conflicts=('diffutils')
source=("${pkgname}::git+git://git.savannah.gnu.org/diffutils.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname" || exit

  # Bootstrap diffutils
  ./bootstrap
}

build() {
  cd "$pkgname" || exit
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname" || exit
  make check
}

package() {
  cd "$pkgname" || exit
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
