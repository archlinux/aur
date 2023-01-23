# Maintainer: René Wagner <rwa AT clttr DOT info>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lcms2-ff-git
pkgver=2.14.r44.ge71aeb6
pkgrel=2
pkgdesc="Small-footprint color management engine including fast_float plugin"
arch=('x86_64')
url="https://www.littlecms.com/"
license=('GPL3')
depends=('glibc' 'libtiff')
makedepends=('git')
provides=('lcms2' 'liblcms2.so')
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
  ./configure --prefix="/usr" --with-fastfloat
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
