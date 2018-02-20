# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Sven Greiner <sven@sammyshp.de>
# Contributor: vldmr <vldmr@lavabit.com>
# Contributor: Thomas Krug <phragment@lavabit.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libfprint-vfs0090-git
epoch=1
pkgver=0.7.0.r87.g877aba1
pkgrel=1
pkgdesc="Library for fingerprint readers (includes WIP libre vfs0090 driver)"
arch=(i686 x86_64)
url="https://github.com/nmikhailov/Validity90"
license=(LGPL)
depends=(libusb nss pixman gnutls openssl)
makedepends=(git)
optdepends=("fprintd: D-Bus daemon that manages fingerprint readers")
groups=(fprint-git)
provides=(libfprint)
conflicts=(libfprint)
source=("git+https://github.com/3v1n0/libfprint.git")
md5sums=('SKIP')

pkgver() {
  cd libfprint
  git describe --long --tags 2>/dev/null | sed 's/^V_//;s/\([0-9]*-g\)/r\1/;s/[-_]/./g'
}

prepare() {
  cd libfprint
  git checkout vfs0090
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

  make DESTDIR="$pkgdir" install
}
