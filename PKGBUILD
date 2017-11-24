# $Id$
# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kbibtex-git
pkgver=r2783.4ce7c51f
pkgrel=1
pkgdesc="A BibTeX editor for KDE"
arch=('x86_64')
url='https://userbase.kde.org/KBibTeX'
license=('GPL')
depends=('poppler-qt5' 'kio' 'icu' 'qoauth' 'libxml2' 'libxslt')
optdepends=('okular: Document preview')
makedepends=('extra-cmake-modules' 'qca-qt5')
source=("git://anongit.kde.org/kbibtex.git")
install="$pkgname.install"

pkgver() {
  cd "$srcdir"/kbibtex
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  mkdir build
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
