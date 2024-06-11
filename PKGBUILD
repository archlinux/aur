# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky AT gmail.com>

pkgname=rawtherapee-git
pkgver=5.10.r274.g4f4a3d233
pkgrel=2
epoch=1
pkgdesc="A powerful cross-platform raw image processing program"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://www.rawtherapee.com/"
license=(GPL-3.0-or-later)
depends=(fftw gtk3 glibmm gtkmm3 lcms2 lensfun libcanberra exiv2 libjxl
         libiptcdata hicolor-icon-theme

         # namcap implicit depends
         libsigc++ libtiff pangomm gcc-libs expat cairomm librsvg atkmm zlib libpng libjpeg cairo glibc glib2)
makedepends=(cmake git)
provides=(rawtherapee)
conflicts=(rawtherapee)
source=("git+https://github.com/Beep6581/RawTherapee.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "RawTherapee"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "RawTherapee" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
