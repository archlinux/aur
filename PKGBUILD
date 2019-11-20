# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=krita-beta
pkgver=4.2.8
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
sha256sums=('e24b962b04e6cad45f8c7fa61bca17a75835ff62a5677a638439cff8a3fafe69')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../krita-$pkgver-$_subver" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
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
