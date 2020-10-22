# Maintainer: Baris Demirdelen <barisdemirdelen at gmail dot com>

pkgname=xow-git
_pkgname=xow
pkgver=0.5.r17.gaf5b9d4
pkgrel=2
epoch=1
pkgdesc="Linux driver for the Xbox One wireless dongle"
arch=(x86_64)
url=https://github.com/medusalix/xow
license=('GPL2')
depends=(libusb)
makedepends=('git' 'cabextract')
source=('git+https://github.com/medusalix/xow')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  make PREFIX=/usr BUILD=RELEASE
}

package() {
  cd $srcdir/$_pkgname

  make PREFIX=/usr DESTDIR=$pkgdir/ SYSDDIR=/usr/lib/systemd/system install
}
