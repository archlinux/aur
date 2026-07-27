# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky AT gmail.com>

pkgname=rawtherapee-git
pkgver=5.13.r1.g123b4d7b5
pkgrel=2
epoch=1
pkgdesc="A powerful cross-platform raw image processing program"
arch=(x86_64 aarch64)
url="https://github.com/Beep6581/RawTherapee"
license=(GPL-3.0-or-later)
depends=(
    atkmm
    cairo
    cairomm
    exiv2
    expat
    fftw
    glib2
    glibc
    glibmm
    gtk3
    gtkmm3
    hicolor-icon-theme
    lcms2
    lensfun
    libcanberra
    libgcc
    libgomp
    #libiptcdata
    libjpeg-turbo
    libjxl
    libpng
    librsvg
    libsigc++
    libstdc++
    libtiff
    pangomm
    zlib
    )
makedepends=(
    cmake
    git
    libiptcdata
    )
provides=(rawtherapee)
conflicts=(rawtherapee)
source=("git+https://github.com/Beep6581/RawTherapee.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "RawTherapee"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "RawTherapee" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
