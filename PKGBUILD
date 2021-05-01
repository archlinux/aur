pkgname=plasma5-applets-mpdnowplaying
_pkgname=mpdnowplaying
pkgver=0.5
pkgrel=1
pkgdesc="MPD plasmoid for Plasma 5."
arch=('x86_64')
url="https://sourceforge.net/projects/mpdnowplaying"
license=('GPL')
depends=('plasma-framework' 'libmpdclient')
makedepends=('extra-cmake-modules')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("${_pkgname}-${pkgver}.tar.bz2::https://sourceforge.net/projects/${_pkgname}/files/${_pkgname}-${pkgver}.tar.bz2/download")
sha256sums=('f5a8f549c1e5d0f353eae52c8c36da7d619e4c4ac861f202c1459e0009ea4608')

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
