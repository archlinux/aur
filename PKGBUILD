# Maintainer: Yorick Rommers <yorick-rommers@hotmail.com>

pkgname=dattobd
pkgver=20150805
pkgrel=1
pkgdesc="kernel module for taking block-level snapshots and incremental backups of Linux block devices"
arch=('any')
url="https://github.com/datto/dattobd"
license=('GPL2')
depends=('')
source=("git://github.com/datto/dattobd.git"
        "http://www.imegumii.nl/dattobd.conf")
md5sums=("SKIP"
         "SKIP")
build() {
  cd "$srcdir/$pkgname"
  sudo make
}

package() {
  cd "$srcdir/$pkgname"
  sudo make install
  sudo install -D "src/dattobd.ko" "/usr/lib/modules//$(uname -r)/"
  sudo install -D "../dattobd.conf" "/etc/modules-load.d/"
  sudo rm -f "src/.tmp_versions/dattobd.mod"
  sudo depmod -a
  sudo modprobe dattobd
}

