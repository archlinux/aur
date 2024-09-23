# Maintainer: Wellington <wellingtonwallace@gmail.com>

pkgname=eyeofsauron-git
pkgver=0.0.1.r0.gdb4fc90
pkgrel=1
pkgdesc='Using webcams and microphone in your Physics classes'
arch=(x86_64 i686)
url='https://github.com/wwmm/eyeofsauron'
license=('GPL3')
depends=(
  'boost-libs'
  'kirigami'
  'kirigami-addons'
  'qqc2-desktop-style'
  'breeze-icons'
  'qt6-base'
  'qt6-multimedia'
  'qt6-charts'
  'opencv'
  'hdf5'
  'vtk'
  'linux-api-headers')
makedepends=('boost' 'cmake' 'extra-cmake-modules' 'git' 'ninja' 'intltool' 'appstream-glib' 'libmediainfo' 'fftw')
#source=("git+https://github.com/wwmm/eyeofsauron.git#branch=eosqt")
source=("git+https://github.com/wwmm/eyeofsauron.git")
conflicts=(eyeofsauron)
provides=(eyeofsauron)
sha512sums=('SKIP')

pkgver() {
  cd eyeofsauron
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  #git describe --long --all | sed 's/^v//;s/^heads\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B build  \
    -S eyeofsauron \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
