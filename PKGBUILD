# Maintainer: nobodyinperson < nobodyinperson at posteo de >

pkgname=kbibtex-next-git
pkgver=0.9.90.r19.gcf671d89
pkgrel=1
epoch=1
pkgdesc="A BibTeX editor for KDE (next release development version)"
arch=('x86_64' 'aarch64')
url='https://userbase.kde.org/KBibTeX'
license=('GPL2')
depends=('poppler-qt5' 'kio' 'icu' 'qt5-networkauth' 'qt5-xmlpatterns' 'libxml2' 'libxslt')
provides=('kbibtex')
conflicts=('kbibtex')
optdepends=('okular: Document preview')
makedepends=('git' 'extra-cmake-modules' 'qca-qt5' 'kdoctools')
source=("git+https://invent.kde.org/office/kbibtex.git#branch=kbibtex/0.10")

pkgver() {
  cd "$srcdir"/kbibtex
  git describe --long --tags --always | sed 's/^[^0-9]\+//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"
  mkdir -p build
}

build() {
  cd "$srcdir"/build
  cmake ../kbibtex \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
sha512sums=('SKIP')
