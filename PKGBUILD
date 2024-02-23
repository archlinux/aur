# Maintainer: René Wagner <rwa AT clttr DOT info>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lcms2-ff
pkgver=2.16
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
source=("https://github.com/mm2/Little-CMS/releases/download/lcms2.16/lcms2-2.16.tar.gz")
sha256sums=('d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51')

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
