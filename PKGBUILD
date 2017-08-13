# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pciutils-git
pkgver=3.5.5.r0.gdfd15a8
pkgrel=1
pkgdesc="Programs for inspecting and manipulating configuration of PCI devices"
arch=('i686' 'x86_64')
url="http://mj.ucw.cz/sw/pciutils/"
license=('GPL2')
depends=('glibc' 'hwids' 'kmod')
makedepends=('git')
provides=('pciutils')
conflicts=('pciutils')
source=("git+https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git")
sha256sums=('SKIP')


pkgver() {
  cd "pciutils"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_OPTIONS='SHARED=yes ZLIB=no'
build() {
  cd "pciutils"

  make OPT="$CFLAGS" "$_OPTIONS"
}

package() {
  cd "pciutils"

  make DESTDIR="$pkgdir" PREFIX="/usr" SBINDIR="/usr/bin" SHAREDIR="/usr/share/hwdata" "$_OPTIONS" install install-lib

  # supplied by hwids package
  rm -rf "$pkgdir/usr/share/hwdata"
}
