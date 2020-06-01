# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=krita-beta
_basever=4.3.0
_subver=beta2
pkgver="$_basever.$_subver"
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
_target="krita-$_basever-$_subver"
source=("https://download.kde.org/unstable/krita/$_basever-$_subver/$_target.tar.xz"
        'krita-pyqt5-sip5.patch'
        'safe-assert.patch')
sha256sums=('63479ea6b009bc55254ac2df7a043ebd659e5fe5db696e308e01bf1a56c89d32'
            'ab2f33843d8cad31bc13e0eca7dc732cdbfed054924f25ed61102c0d0971c1d8'
            '890edc92a297edbed001263b069767c34fdd51a45969ea12ae760cc4c8f98ee4')

prepare() {
  mkdir -p build
  cd "$_target"
  patch -Np1 -i ../krita-pyqt5-sip5.patch
  patch -Np1 < ../safe-assert.patch
}

build() {
  cd build
  cmake "../$_target"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
