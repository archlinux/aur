# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libmikmod-git
pkgver=3.3.11.1
pkgrel=1
pkgdesc="Module player library supporting many formats, including MOD, S3M, IT and XM"
url=http://mikmod.sourceforge.net
license=(GPL2 LGPL2.1)
arch=(x86_64)
depends=(glibc libpulse sh)
makedepends=(alsa-lib cmake)
provides=(libmikmod.so libmikmod)
conflicts=(libmikmod)
source=(git://git.code.sf.net/p/mikmod/mikmod.git)
sha256sums=('SKIP')

pkgver() {
  cd mikmod
  git describe --tags | sed 's/-/+/g'
}

build() {
  # cmake ignores CPPFLAGS
  CFLAGS+=" $CPPFLAGS"

  cmake -Hmikmod/libmikmod -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DL=1
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --build build --target install
}

# vim: ts=2 sw=2 et:

