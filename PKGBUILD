# Maintainer: Baris Demirdelen <barisdemirdelen at gmail dot com>

pkgname=xow-git
_pkgname=xow
pkgver=130
pkgrel=2
pkgdesc="Linux driver for the Xbox One wireless dongle"
arch=(x86_64)
url=https://github.com/medusalix/xow
license=('GPL2')
depends=(libusb)
makedepends=('git' 'curl' 'cabextract')
source=('git+https://github.com/medusalix/xow')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git rev-list --count HEAD
}

build() {
  cd $srcdir/$_pkgname
  make PREFIX=/usr BUILD=RELEASE
}

package() {
  cd $srcdir/$_pkgname

  make PREFIX=/usr DESTDIR=$pkgdir/ SYSDDIR=/usr/lib/systemd/system install

  echo ""
  echo "If you want to enable and start the service please run:"
  echo "systemctl enable --now xow.service"
  echo ""
  echo "If you want udev rules to take effect please run:"
  echo "udevadm control --reload; udevadm trigger"
  echo ""
  echo "If this is the first time installing this package it is recommended to"
  echo " restart the system to make the module blacklist take effect"
  echo ""
}
