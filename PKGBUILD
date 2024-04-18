# Maintainer: Marcel Hasler <mahasler at gmail dot com>
pkgname=plasma-applet-mpdnowplaying
_pkgname=mpdnowplaying
pkgver=0.6
pkgrel=1
pkgdesc="MPD plasmoid for Plasma 6."
arch=('x86_64')
url="https://github.com/marcelh83/mpdnowplaying"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'qt6-base' 'qt6-declarative' 'kirigami' 'plasma5support' 'libplasma' 'libmpdclient')
makedepends=('extra-cmake-modules')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("mpdnowplaying-0.6.tar.gz::https://github.com/marcelh83/mpdnowplaying/archive/refs/tags/v0.6.tar.gz")
sha256sums=('141ff66ec3dd43a66b5ea22887fec761b962120316f0e021f548ccbdc76fd759')

build() {
  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build && cd build

  cmake "../${_pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  make
}

package() {
  cd build
  make install DESTDIR="${pkgdir}"
}
