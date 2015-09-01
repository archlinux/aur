# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Vasco Costa <vasco dot costa at geekslot dot com>
pkgname=hoard
_pkgname=Hoard
pkgver=3.11
pkgrel=1
pkgdesc="Fast scalable and memory-efficient memory allocator"
arch=('i686' 'x86_64')
url="http://www.hoard.org/"
license=('GPL')
depends=('gcc')
install=$pkgname.install
source=()
md5sums=()

build() {
  cd ${srcdir}
  git clone --recursive --single-branch -b $pkgver https://github.com/emeryberger/Hoard.git
  cd $_pkgname/src
  if [ "$CARCH" = "x86_64" ]; then
    make linux-gcc-x86-64 || return 1
  else
    make linux-gcc-x86 || return 1
  fi
}

package(){
  cd ${srcdir}/$_pkgname/src
  install -D -m755 libhoard.so ${pkgdir}/usr/lib/libhoard.so
}
