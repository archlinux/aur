# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: gumper <gumper1034@gmail.com>

pkgname=libalkimia-git
pkgver=8.1.92.r59.gb7537b4
pkgrel=1
pkgdesc="A library with common classes and functionality used by finance applications for the KDE SC"
arch=('x86_64')
url="https://community.kde.org/Alkimia/libalkimia"
license=('LGPL')
depends=('qt5-webengine' 'knewstuff5' 'hicolor-icon-theme' 'perl')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules' 'kdoctools5' 'git')
provides=("libalkimia=8.1.90")
conflicts=(libalkimia)
source=('git+https://invent.kde.org/office/alkimia.git/')
sha256sums=('SKIP')

pkgver() {
  cd alkimia
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build

  cmake -DSHARE_INSTALL_DIR=/usr/share -DBUILD_APPLETS=OFF ../alkimia
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}
