# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Maxim Vuets <maxim.vuets@gmail.com>

pkgname=cuneiform
pkgver=0.9.0
_dpkgver=0.9
pkgrel=2
pkgdesc="Linux port of an OCR system developed in Russia. Supports more than 20 languages."
arch=('i686' 'x86_64')
url="https://launchpad.net/cuneiform-linux"
license=('BSD')
depends=(imagemagick)
makedepends=(cmake)
source=(http://launchpad.net/cuneiform-linux/${_dpkgver}/cuneiform-linux-${_dpkgver}/+download/${pkgname}-linux-${pkgver}.tar.bz2)
md5sums=('93f2061560ed19add5ba9d26d10d2bb4')

build() {
  _SRC_ROOT="${srcdir}/${pkgname}-linux-${pkgver}"
  cd "${_SRC_ROOT}"
  sed -i 's#lib64#lib#' install_files.cmake
  mkdir builddir
  cd builddir

  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  mkdir -p "${pkgdir}/usr/share/licenses/cuneiform"
  cp "${_SRC_ROOT}/cuneiform_src/Kern/license.txt" \
    "${pkgdir}/usr/share/licenses/cuneiform"
}

