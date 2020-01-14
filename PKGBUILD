# Maintainer: Baris Demirdelen <barisdemirdelen at gmail dot com>

pkgname=xow-git
_pkgname=xow
pkgver=28
pkgrel=2
pkgdesc="Linux driver for the Xbox One wireless dongle"
arch=(x86_64)
url=https://github.com/medusalix/xow
license=('GPL2')
depends=(libusb)
makedepends=(git)
source=('git+https://github.com/medusalix/xow')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git rev-list --count HEAD
}

build() {
  cd $srcdir/$_pkgname
  make PREFIX="/usr" BUILD=RELEASE
  make PREFIX="/usr" BUILD=RELEASE xow.service
}

package() {
  cd $srcdir/$_pkgname

  make DESTDIR=$pkgdir/usr PREFIX="" install

  echo "If you want to enable and start the service please run:"
  echo "systemctl enable --now xow.service"
}
