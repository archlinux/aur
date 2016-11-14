# Maintainer: Que Quotion <quequotion at gmail dot com>

pkgname=recpt1-stz-git
pkgver=23.00df64e
pkgrel=1
pkgdesc="Earthsoft PT-series controller (modified by stz2012)."
groups=('earthsoft')
arch=('i686' 'x86_64')
source=("git+https://github.com/stz2012/recpt1.git")
url='https://github.com/stz2012/recpt1/'
license=('unknown')
provides=('recpt1')
depends=('b25' 'pcsclite')
sha512sums=('SKIP')
makedepends=('git')
optdepends=('pt3-drv: Japanese Earthsoft PT-3 chardev driver'
            'pt1-drv: Japanese Earthsoft PT-1/2 chardev driver')

pkgver() {
  cd "recpt1"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {

  cd "$srcdir/recpt1/recpt1"
  chmod u+x autogen.sh
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --enable-b25 
  make

}

package() {
  cd "$srcdir/recpt1/recpt1"
  mkdir -p "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
