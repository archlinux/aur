# Maintainer: KNOSSOS-Team <knossos-team ät mpimf-heidelberg.mpg.de>

pkgname="qt5-python27-git"
pkgver=3.0+16.gf3755ad.dirty
pkgrel=1
arch=("any")
pkgdesc="PythonQt fork featuring Qt 5.x and Python 3.x support and improved CMake build system (Qt5 and Python2.7 version)"
license=("LGPL")
url="https://github.com/knossos-project/PythonQt"
makedepends=("cmake"
  "ninja"
)
depends=("python2"
  "qt5-base"
  "qt5-multimedia"
  "qt5-svg"
  "qt5-tools"
  "qt5-webkit"
  "qt5-xmlpatterns"
)
provides=("qt5-python27"
  "pythonqt"
)
conflicts=("pythonqt")
replaces=("qt5-python26"
  "qt5-python25"
  "qt5-python24"
  "qt5-python23"
  "qt5-python22"
  "qt5-python21"
  "qt5-python20"
)
source=("git+https://github.com/knossos-project/PythonQt.git")
md5sums=('SKIP')

pkgver() {
  cd "PythonQt"
  git describe --always --dirty --tags | sed 's/^v//;s/-/+/;s/-/./g'
}

build() {
  mkdir -p "$srcdir/build-$CHOST-$pkgname"
  cd "$srcdir/build-$CHOST-$pkgname"
  cmake -G Ninja -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=TRUE -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DPythonQt_Qt5=TRUE -DPythonQt_Python3=FALSE ../PythonQt
  ninja
}

check() {
  cd "$srcdir/build-$CHOST-$pkgname"
  ninja tests
}

package() {
  cd "$srcdir/build-$CHOST-$pkgname"
  ninja install
}
