# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=konqueror-git
pkgver=00
pkgrel=1
pkgdesc="KDE File Manager & Web Browser"
arch=("x86_64")
url="https://konqueror.org/"
license=("LGPL")
depends=("dolphin" "keditbookmarks" "qt5-webengine" "kdelibs4support" "khtml")
makedepends=("extra-cmake-modules" "kdoctools" "tidy" "kdesignerplugin" "kdesu")
optdepends=('tidy: tidy HTML plugin' 'kdesu: shell command plugin')
conflicts=("konqueror")
provides=("konqueror")
groups=("kde-applications" "kdebase")
source=("git+https://invent.kde.org/network/konqueror.git")
sha512sums=('SKIP')


pkgver() {
    cd konqueror
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make "DESTDIR=$pkgdir" install
}
