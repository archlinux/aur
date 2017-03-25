# Contributor: Vjacheslav Gaevskih <feanor1397@gmail.com>

pkgname=gspectran-git
pkgver=0.2.gb6bcf02
pkgrel=1
pkgdesc="Gtk+ audio visualizer for pulseaudio. (Git Version)"
arch=('x86_64' 'i686')
url='https://github.com/Feanor1397/gspectran'
license=('GPLv3')
depends=('libpulse'
         'fftw'
         'cairomm'
         'gtkmm3'
         'boost-libs'
         )
makedepends=('git'
             'cmake'
             'pkg-config'
             'boost'
             )
conflicts=('gspectran')
provides=('gspectran')
source=('git+https://github.com/Feanor1397/gspectran.git#branch=gspectran')
sha256sums=('SKIP')

pkgver() {
  cd gspectran
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../gspectran \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Debug
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
