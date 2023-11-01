# Maintainer: Marcel Hasler <mahasler at gmail dot com>
pkgname=plasma5-applets-mpdnowplaying
_pkgname=mpdnowplaying
pkgver=0.5.1
pkgrel=1
pkgdesc="MPD plasmoid for Plasma 5."
arch=('x86_64')
url="https://sourceforge.net/projects/mpdnowplaying"
license=('GPL')
depends=('glibc' 'gcc-libs' 'qt5-base' 'qt5-declarative' 'plasma-framework5' 'libmpdclient')
makedepends=('extra-cmake-modules')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("${_pkgname}-${pkgver}.tar.zst::https://sourceforge.net/projects/${_pkgname}/files/${_pkgname}-${pkgver}.tar.zst/download")
sha256sums=('9ea01c9b7aa3e25f8e8ee55b532585767a4912ac02b079e19cd430f55d89b47f')

build() {
  cd "${_pkgname}"

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  make
}

package() {
  cd "${_pkgname}"/build
  make install DESTDIR="${pkgdir}"
}
