# Maintainer: sygnmdev <sygnmdev at sygnm dot org>
pkgname=sygnm-cantor-git
pkgver=1.0.0alpha1
pkgrel=1
pkgdesc="Cantor (https://edu.kde.org/cantor/) with experimental sygnm backend"
url="https://sygnm.org"
arch=(i686 x86_64)
license=(GPL LGPL FDL)
depends=(analitza libspectre kpty ktexteditor knewstuff libqalculate hicolor-icon-theme)
conflicts=(cantor)
makedepends=(extra-cmake-modules python python2 kdoctools luajit r julia)
optdepends=('maxima: Maxima backend'
            'octave: Octave backend'
            'r: R backend'
            'luajit: LUA backend'
            'python: Python 3 backend'
	        'python2: Python 2 backend'
            'sagemath: SageMath backend'
            'julia: Julia backend'
            'sygnm-git: sygnm backend')
source=("cantor-sygnm::git+https://git.sygnm.org/sygnmdev/cantor-sygnm.git#branch=sygnm")

md5sums=('SKIP')

build() {
  cd "${srcdir}/cantor-sygnm"

  if [[ $CARCH == 'i686' ]]; then
    export CFLAGS+=" -march=pentium4"
    export CXXFLAGS+=" -march=pentium4"
  fi

  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so
  make
}

package() {
 cd "${srcdir}/cantor-sygnm"
 make DESTDIR="$pkgdir/" install
} 
