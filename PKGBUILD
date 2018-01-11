# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=krita-beta
pkgver=4.0.0.51
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
source=("https://download.kde.org/unstable/krita/$pkgver/krita-$pkgver.tar.gz")
md5sums=('e15ac7343127c39dd24fe99947193118')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../krita-$pkgver" \
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
