_gitname=sigrok-firmware-fx2lafw
pkgname="${_gitname}-git"
pkgver=0.1.4.r0.g2970556
pkgrel=1
pkgdesc="An open-source firmware for Cypress FX2"
arch=(any)
url="http://sigrok.org/wiki/Fx2lafw"
license=(GPL2)
depends=()
makedepends=(sdcc)
conflicts=('sigrok-firmware-fx2lafw')
source=("git://sigrok.org/${_gitname}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/^sigrok-firmware-fx2lafw-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd ${srcdir}/${_gitname}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package(){
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} install
}
