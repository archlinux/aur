# Maintainer: René Wagner <rwa AT clttr DOT info>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lcms2-ff-git
pkgver=2.15
pkgrel=1
pkgdesc="Small-footprint color management engine including fast_float plugin"
arch=('x86_64')
url="https://www.littlecms.com/"
license=('GPL3')
depends=('glibc' 'libtiff')
makedepends=('git')
provides=('lcms2' 'liblcms2.so')
conflicts=('lcms2')
options=('staticlibs')
source=("git+https://github.com/mm2/Little-CMS.git#tag=lcms${pkgver}")
sha256sums=('SKIP')

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
