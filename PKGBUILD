# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=gr-gsm-git
pkgver=r1194.a77cf59
pkgrel=1
pkgdesc="Gnuradio blocks and tools for receiving GSM transmissions"
arch=(x86_64)
url="https://osmocom.org/projects/gr-gsm/wiki"
license=(GPL3)
depends=(gnuradio gnuradio-osmosdr libosmocore boost-libs
         python-pyqt5 qwt #gui
         glibc gcc-libs python)
makedepends=(cmake boost git doxygen graphviz python-docutils python-yaml pybind11) #swig log4cpp
provides=(gr-gsm)
conflicts=(gr-gsm)
#source=("git+https://gitea.osmocom.org/sdr/gr-gsm.git")
source=(git+https://github.com/bkerler/gr-gsm.git#branch=maint-3.10)
sha256sums=('SKIP')

pkgver() {
  cd gr-gsm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "gr-gsm" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
