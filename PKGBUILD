# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=krita-beta
pkgver=4.3.0
_subver=beta1
pkgrel=1
pkgdesc="Edit and paint images - beta release"
arch=(x86_64)
url="https://krita.org"
license=(GPL3)
depends=(kio fftw hicolor-icon-theme libraw gsl boost-libs exiv2 openexr poppler-qt5 opencolorio)
makedepends=(extra-cmake-modules kdoctools python boost eigen)
optdepends=()
provides=(krita)
conflicts=(krita)
_target="krita-$pkgver-$_subver"
source=("https://download.kde.org/unstable/krita/$pkgver-$_subver/$_target.tar.xz"
        'krita-pyqt5-sip5.patch')
sha256sums=('e2a3a61f3d8be6009895417c5094859a98307091b12624eb52281f2657e23ff0'
            'ab2f33843d8cad31bc13e0eca7dc732cdbfed054924f25ed61102c0d0971c1d8')

prepare() {
  mkdir -p build
  cd "$_target"
  patch -Np1 -i ../krita-pyqt5-sip5.patch
}

build() {
  cd build
  cmake "../$_target" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
