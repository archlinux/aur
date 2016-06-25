# Maintainer: brent s. <bts [at] square-r00t [dot] net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Based on: https://aur.archlinux.org/packages/nwipe/ (by M0Rf30 <morf3089 [at] gmail [dot] com>)

pkgname=nwipe-git
_pkgname=nwipe
pkgver=r24.8a9a718
pkgrel=3
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

