# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=krita-beta
pkgver=4.2.6
_subver=beta1
pkgrel=1
pkgdesc="Edit and paint images - beta release"
arch=(x86_64)
url="https://krita.org"
license=(GPL3)
groups=()
depends=(kio fftw hicolor-icon-theme libraw gsl boost-libs exiv2 openexr poppler-qt5 opencolorio)
makedepends=(extra-cmake-modules kdoctools python boost eigen)
optdepends=()
provides=(krita)
conflicts=(krita)
source=("https://download.kde.org/unstable/krita/$pkgver-$_subver/krita-$pkgver-$_subver.tar.xz")
sha256sums=('2df128a8dab6cbae66e20e49dca56d8843043619ac0a95216db708b2babe5107')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../krita-$pkgver-$_subver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DPACKAGERS_BUILD=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
