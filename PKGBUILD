# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=krita-beta
pkgver=4.2.7
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
sha256sums=('7ee233dd7002e428896db76dac02ba61d6e816a86bcf0b2004b5c81ef76f5f7a')

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
