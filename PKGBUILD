# Maintainer: brent s. <bts [at] square-r00t [dot] net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')
# Based on: https://aur.archlinux.org/packages/nwipe/ (by M0Rf30 <morf3089 [at] gmail [dot] com>)

pkgname=nwipe-git
_pkgname=nwipe
pkgver=r24.8a9a718
pkgrel=2
pkgdesc="A fork of the dwipe command that will securely erase disks using a variety of recognised methods (from Git)"
arch=('i686' 'x86_64')
url="http://www.andybev.com/index.php/Nwipe"
depends=('device-mapper' 'ncurses' 'parted')
license=('GPL2')
source=('git+https://github.com/martijnvanbrummelen/nwipe.git')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

