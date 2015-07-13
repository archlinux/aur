# Maintainer: Konstantin Semenov <zemen17@gmail.com>

pkgname=libfprint-vfs0050
epoch=1
pkgver=0.6.0
pkgrel=1
pkgdesc="Library for fingerprint readers with vfs0050 driver"
arch=(i686 x86_64)
url="https://github.com/zemen/libfprint"
license=(LGPL)
depends=(libusb nss pixman)
makedepends=(git)
groups=(fprint-git)
provides=(libfprint)
conflicts=(libfprint)

source=("git+https://github.com/zemen/libfprint.git")
md5sums=('SKIP')

pkgver() {
  cd libfprint
  git describe --long --tags 2>/dev/null | sed 's/^v_//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd libfprint
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd libfprint
  make DESTDIR="$pkgdir" install
}
