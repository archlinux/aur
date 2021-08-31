# Maintainer: Endlesseden <eden @ rose.place>
# Archlinux Maintainer: Jan de Groot <jgc@archlinux.org>
# Archlinux Contributor: Eduardo Romero <eduardo@archlinux.org>
# Archlinux Contributor: Jason Chu <jason@archlinux.org>

pkgname=gphoto2-git
_pkgname=gphoto2
pkgver=gphoto2+2.5.27+27+g35af480
pkgrel=1
pkgdesc="A digital camera download and access program."
arch=(x86_64)
url="http://www.gphoto.org"
license=('GPL' 'LGPL')
provides=("$pkgname" "$_pkgname")
conflicts=("$_pkgname")
depends=('libgphoto2' 'popt')
makedepends=(git)

source=("$pkgname"::"git+https://github.com/gphoto/gphoto2")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^libgphoto2-//;s/-release//;s/^v//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  autoreconf -fvi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
}
