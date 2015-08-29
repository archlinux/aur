# Maintainer: brent s. <bts [at] square-r00t [dot] net>
# Based on: https://aur.archlinux.org/packages/nwipe/ (by M0Rf30 <morf3089 [at] gmail [dot] com>)

pkgname=nwipe-git
_pkgname=nwipe
pkgver=r24.8a9a718
pkgrel=1
pkgdesc="A fork of the dwipe command that will securely erase disks using a variety of recognised methods (from Git)"
arch=('i686' 'x86_64')
url="http://www.andybev.com/index.php/Nwipe"
depends=('device-mapper' 'ncurses' 'parted')
license=('GPL2')
source=('git+https://github.com/martijnvanbrummelen/nwipe.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #( set -o pipefail
  #  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
  )
}

build() {
  cd "${srcdir}"/${_pkgname}
  ./init.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" install
}

