# Maintainer: David Adler <d dot adler aet posteo dot de>

_pkgname=gnucap-geda
pkgname=$_pkgname-git
pkgver=r380.4fe0c54
pkgrel=1
pkgdesc="gEDA extensions for Gnucap"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('gnucap' 'boost' 'geda-gaf')
makedepends=('git')
provides=('gnucap-geda')
conflicts=('gnucap-geda')
source=("$_pkgname::git+git://git.sv.gnu.org/gnucap/gnucap-plugins.git#branch=geda")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./bootstrap
  ./configure --prefix=/usr
  make
}

check() {
  cd $_pkgname
  make check
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
