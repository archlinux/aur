pkgname=plasma5-applets-mpdnowplaying
_pkgname=mpdnowplaying
pkgver=0.4
pkgrel=1
pkgdesc="MPD plasmoid for Plasma 5."
arch=('i686' 'x86_64')
url=
license=('GPL')
depends=('plasma-framework')
makedepends=('extra-cmake-modules')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=(https://dl.opendesktop.org/api/files/download/id/1511089109/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('4988eaac0ebceba173b747f1beb736ca')

build() {
  cd "${_pkgname}"

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  make
}

package() {
  cd "${_pkgname}"/build
  make install DESTDIR="${pkgdir}"
}
