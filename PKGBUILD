# Maintainer: willemw <willemw12@gmail.com>

_pkgname=nutty
pkgname=$_pkgname-bzr
pkgver=r80
pkgrel=1
pkgdesc="Network utility providing essential information on network related aspects (nethogs, nmap, traceroute, vnstat, ...)"
arch=('i686' 'x86_64')
url="https://launchpad.net/nutty"
license=('GPL3')
makedepends=('bzr' 'cmake' 'vala')
depends=('granite' 'gtk3' 'libgee' 'net-tools' 'nethogs' 'nmap' 'traceroute' 'vnstat')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::bzr+https://code.launchpad.net/nutty/trunk)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd $pkgname
  rm -rf build
  mkdir -p build
}

build() {
  cd $pkgname/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $pkgname/build
  make DESTDIR="$pkgdir/" install
}

