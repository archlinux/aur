# Maintainer: silviof.ricke (gmail)
# Contributor: SanskritFritz (gmail)
# Contributor: tsdgeos (AUR)

_pkgname=charmtimetracker
pkgname=${_pkgname}-git
pkgver=1.12.0.r027.g4f8377a
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Keep track of time. It is built around two major ideas - tasks and events. Development Version"
license=("GPL")
depends=('qtkeychain' 'hicolor-icon-theme')
makedepends=('cmake' 'make')
url="https://github.com/KDAB/Charm"
source=("${_pkgname}::git+https://github.com/KDAB/Charm.git")
sha256sums=('SKIP')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | awk -F '-' '/-/{ printf "%s.r%3.3d.%s\n", $1, $2, $3 }'
}

prepare() {
  mkdir -p build
}

build() {
    cd build
    cmake \
      -DCharm_VERSION=${pkgver} \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_TESTING=OFF \
      ../${_pkgname}
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
