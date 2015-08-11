# Maintainer: M0Rf30
# Contributor: brikler 

pkgname=fwts-git
pkgver=3056.9ddce1f
pkgrel=1
pkgdesc="The FirmWare Test Suite is a tool to do automatic testing of a PC's firmware"
arch=('i686' 'x86_64')
url="http://smackerelofopinion.blogspot.com/2010/08/firmware-test-suite-biosacpi-health.html"
license=('GPL')
depends=('pcre' 'json-c')
makedepends=('git')
source=('fwts::git://kernel.ubuntu.com/hwe/fwts.git')

build() {
  cd fwts
  autoreconf -ivf
  CPPFLAGS="$CPPFLAGS -O2"
  CFLAGS=--sysroot= ./configure --prefix=/usr
  make
}

package() {
  cd fwts
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd fwts
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
