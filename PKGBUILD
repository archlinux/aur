# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lcms2-git
pkgver=2.9rc1.r12.g66aeefe
pkgrel=1
pkgdesc="Small-footprint color management engine"
arch=('i686' 'x86_64')
url="https://www.littlecms.com/"
license=('MIT')
depends=('glibc' 'libtiff')
makedepends=('git')
provides=('lcms2')
conflicts=('lcms2')
options=('staticlibs')
source=("git+https://github.com/mm2/Little-CMS.git")
sha256sums=('SKIP')


pkgver() {
  cd "Little-CMS"

  git describe --long --tags | sed 's/^lcms//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "Little-CMS"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "Little-CMS"

  make check
}

package() {
  cd "Little-CMS"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/lcms2/COPYING"
}
