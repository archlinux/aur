# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=libfprint-vfs0097-git
pkgver=0.7.0.r97.gd031869
pkgrel=1
pkgdesc="Library for fingerprint readers (patch for 138a:0097)"
arch=(i686 x86_64)
url="https://github.com/nmikhailov/Validity90"
license=(LGPL)
depends=(libusb nss pixman gnutls openssl)
makedepends=(git)
optdepends=("fprintd: D-Bus daemon that manages fingerprint readers")
groups=(fprint-git)
provides=(libfprint)
conflicts=(libfprint)
replaces=(libfprint-vfs0097)
source=("git+https://github.com/hrenod/libfprint.git")
md5sums=('SKIP')

pkgver() {
  cd libfprint
  git describe --long --tags 2>/dev/null | sed 's/^V_//;s/\([0-9]*-g\)/r\1/;s/[-_]/./g'
}

prepare() {
  cd libfprint

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libfprint

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-static
  make
}

package() {
  cd libfprint

  make install DESTDIR="$pkgdir"
}
