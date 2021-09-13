# Maintainer: revel <revelΘmuub·net>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: tmm1 <archΘtmm1·net>

pkgname=duma
pkgver=2.5.21
pkgrel=2
pkgdesc='Detect Unintended Memory Access (D.U.M.A.) - A Red-Zone memory allocator'
arch=('i686' 'x86_64')
url='https://github.com/johnsonjh/duma'
license=('GPL')
depends=('bash' 'gcc-libs')
_pkgver="${pkgver//./_}"
source=("https://github.com/johnsonjh/duma/archive/refs/tags/VERSION_${_pkgver}.tar.gz"
	"tests_dynamic_exceptions.patch")
sha256sums=('470aa72e7018f0beadb5fbe3c932a62ba1b0594c29158a744c614bfa42133e59'
	    'b83fdf43711da3ff065592da9c45fe6efd422e4f9585159e1e11dc327307697b')

prepare() {
  cd "${pkgname}-VERSION_${_pkgver}"
#  sed -i 's/CPPFLAGS=/\0-std=gnu++98 /g' GNUmakefile
  patch -p1 -i ../tests_dynamic_exceptions.patch
}

build() {
  cd "${pkgname}-VERSION_${_pkgver}"
  make --jobs=1
}

check() {
  cd "${pkgname}-VERSION_${_pkgver}"
  make check
}

package() {
  cd "${pkgname}-VERSION_${_pkgver}"
  make prefix="$pkgdir/usr/" install
#  install -m644 duma_hlp.h "$pkgdir/usr/include/"
}
