# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=duperemove-git
pkgver=0.15.r1.ge78bbb5
pkgrel=1
pkgdesc="Btrfs extent deduplication utility"
arch=('x86_64' 'i686')
url="https://github.com/markfasheh/duperemove"
license=('GPL')
depends=('libbsd' 'glib2' 'sqlite')
makedepends=('git' 'pandoc')
provides=('duperemove')
conflicts=('duperemove')
source=(${pkgname}::'git+https://github.com/markfasheh/duperemove.git#branch=master')
b2sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo $(git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
  cd ${pkgname}
  CFLAGS+=" --std=c23" make
}

package() {
  cd ${pkgname}
  make PREFIX=/usr SBINDIR=/usr/bin DESTDIR="${pkgdir}" install
}
