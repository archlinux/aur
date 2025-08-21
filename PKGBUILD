# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: gumper <gumper1034@gmail.com>

pkgname=libalkimia-git
pkgver=8.2.1.r7.gaf0f368
pkgrel=1
pkgdesc="A library with common classes and functionality used by finance applications for the KDE SC"
arch=('x86_64')
url="https://community.kde.org/Alkimia/libalkimia"
license=('LGPL-2.1-or-later')
depends=('qt6-webengine' 'knewstuff' 'ktextwidgets')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules' 'kdoctools')
provides=('libalkimia')
conflicts=('libalkimia')
source=('git+https://invent.kde.org/office/alkimia.git#branch=8.2') # branch with the latest commit
sha256sums=('SKIP')

pkgver() {
  cd alkimia
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S alkimia \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_APPLETS=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
