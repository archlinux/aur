# Maintainer: Stefan Damm <autama@nurfuerspam.de>
pkgname=entropy-piano-tuner
pkgver=git
pkgrel=1
pkgdesc="Free Software for Piano Tuning"
arch=('i686' 'x86_64')
url="https://gitlab.com/tp3/Entropy-Piano-Tuner"
license=('GPL3')
depends=('qtmidi-qt5' 'qwt' 'libuv' 'hicolor-icon-theme' 'qt5-multimedia' 'fftw' 'qt5-declarative')

source=(git+https://gitlab.com/tp3/Entropy-Piano-Tuner.git rpath.patch)
md5sums=('SKIP'
         'e7f34645ebe707be6d417f1f4bc31ebd')

prepare() {
  cd Entropy-Piano-Tuner
  patch -Np1 -i ../rpath.patch
}

build() {
  cd "Entropy-Piano-Tuner"
  git submodule update --init

  rm -rf build
  mkdir build
  cd build

  qmake-qt5 -r .. "PKGDIR=$pkgdir/" "EPT_INSTALL_BIN_RDIR=usr/bin" "EPT_INSTALL_DATA_RDIR=usr/share" "EPT_INSTALL_LIB_RDIR=usr/lib"
  make
}

package() {
  cd "Entropy-Piano-Tuner/build"

  make install

  echo "Test"
}
