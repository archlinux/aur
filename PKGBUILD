# $Id$
# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kbibtex-git
pkgver=r3338.0c711606
pkgrel=1
pkgdesc="A BibTeX editor for KDE (latest development version)"
arch=('x86_64' 'aarch64')
url='https://userbase.kde.org/KBibTeX'
license=('GPL2')
depends=('poppler-qt5' 'kio' 'icu' 'qt5-networkauth' 'qt5-xmlpatterns' 'libxml2' 'libxslt')
provides=('kbibtex')
conflicts=('kbibtex')
optdepends=('okular: Document preview')
makedepends=('git' 'extra-cmake-modules' 'qca-qt5' 'kdoctools')
source=("git+https://invent.kde.org/office/kbibtex.git")

pkgver() {
  cd "$srcdir"/kbibtex
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
