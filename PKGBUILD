# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openexr-git
pkgver=3.2.126.r21.g502b246c
pkgrel=1
pkgdesc="Reference implementation of the EXR format"
arch=('i686' 'x86_64')
url="https://www.openexr.com/"
license=('BSD-3-Clause')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cmake' 'boost' 'chrpath' 'freeglut' 'python' 'python-numpy')
optdepends=('boost-libs: python support'
            'python: python support')
provides=("openexr=$pkgver")
conflicts=('openexr' 'ilmbase')
source=("git+https://github.com/AcademySoftwareFoundation/openexr.git")
sha256sums=('SKIP')


pkgver() {
  cd "openexr"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "openexr"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  make -C "_build"
}

check() {
  cd "openexr"

  #make -C "_build" test
}

package() {
  cd "openexr"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 {LICENSE.md,PATENTS} -t "$pkgdir/usr/share/licenses/openexr"
}
