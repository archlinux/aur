# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Maxim Vuets <maxim.vuets@gmail.com>

pkgname=cuneiform
pkgver=1.1.0
_dpkgver=1.1
pkgrel=4
pkgdesc='Linux port of an OCR system developed in Russia. Supports more than 20 languages'
arch=('i686' 'x86_64')
url="https://launchpad.net/cuneiform-linux"
license=('BSD')
depends=('imagemagick')
makedepends=('cmake')
source=(http://launchpad.net/cuneiform-linux/${_dpkgver}/${_dpkgver}/+download/cuneiform-linux-${pkgver}.tar.bz2)
md5sums=('09fd160cdfc512f26442a7e91246598d')

_SRC_ROOT="${srcdir}/${pkgname}-linux-${pkgver}"

build() {
  cd "${_SRC_ROOT}"
  sed -i 's#lib64#lib#' install_files.cmake
  mkdir builddir
  cd builddir

  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${_SRC_ROOT}"/builddir
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${_SRC_ROOT}/cuneiform_src/Kern/license.txt" \
    "${pkgdir}/usr/share/licenses/cuneiform/license.txt"
}
