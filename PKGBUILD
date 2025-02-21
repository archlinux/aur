# Maintainer: René Wagner <rwa AT clttr DOT info>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lcms2-ff
pkgver=2.17
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
source=("https://github.com/mm2/Little-CMS/releases/download/lcms${pkgver}/lcms2-${pkgver}.tar.gz")
sha256sums=('d11af569e42a1baa1650d20ad61d12e41af4fead4aa7964a01f93b08b53ab074')

build() {
  cd "lcms2-${pkgver}"

  ./autogen.sh
  ./configure --prefix="/usr" --with-fastfloat
  make
}

check() {
  cd "lcms2-${pkgver}"

  make check
}

package() {
  cd "lcms2-${pkgver}"

  make DESTDIR="$pkgdir" install
}
