# Maintainer: Arnaud Dovi <mr.dovi@gmail.com>

pkgname=alpm_octopi_utils-git
pkgver=r20.1e735c3
pkgrel=1
pkgdesc="Alpm utils for Octopi (git)"
url="https://tintaescura.com/projects/octopi/"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('alpm_octopi_utils' 'alpm_octopi_utils-dev')
provides=('alpm_octopi_utils')
depends=('pacman-contrib')
makedepends=('vala')
source=('git+https://github.com/aarnt/alpm_octopi_utils.git')
sha512sums=('SKIP')
_pkgname="${pkgname/-*/}"

pkgver() {
  cd "$_pkgname"
  printf "%s" "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

#prepare() {
#  cd "${_pkgname}
#}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  install -D -m755 src/libalpm_octopi_utils.so "$pkgdir"/usr/lib/libalpm_octopi_utils.so
  install -D -m644 src/libalpm_octopi_utils.pc "$pkgdir"/usr/lib/pkgconfig/libalpm_octopi_utils.pc
  install -D -m644 src/alpm_octopi_utils.h "$pkgdir"/usr/include/alpm_octopi_utils.h
}
