# Maintainer: willemw <willemw12@gmail.com>

_pkgname=diodon
pkgname=$_pkgname-bzr
pkgver=r469
pkgrel=1
pkgdesc="GTK+ clipboard manager"
arch=('any')
url="https://launchpad.net/diodon"
license=('GPL2')
depends=('gconf' 'gtk-update-icon-cache' 'libgee06' 'libpeas' 'libunique3' 'libxtst' 'libzeitgeist' 'dconf' 'libappindicator-gtk3')
makedepends=('bzr' 'vala' 'xorg-server-xvfb')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
source=($pkgname::bzr+https://code.launchpad.net/diodon/trunk)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd $pkgname
  # Uncomment the following lines to disable the tests
  #rm -rf tests/*
  #touch tests/wscript_build
}

build() {
  cd $pkgname
  python2 ./waf configure --prefix=/usr
  python2 ./waf build
}

package() {
  cd $pkgname
  python2 ./waf install --destdir="$pkgdir"
}

