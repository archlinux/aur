# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=photobook-git
pkgver=b97b012
pkgrel=1
pkgdesc="A photo manger for KDE"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/graphics/photobook"
license=('GPL')
depends=('xapian-core' 'libkexiv2' 'kdebase-runtime')
makedepends=('automoc4')
provides=(photobook)
conflicts=(photobook)
source=("photobook::git://anongit.kde.org/photobook")
sha256sums=('SKIP')

pkgver() {
  cd photobook
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/photobook"

  mkdir build
  cd build
  cmake ../ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/photobook/build"

  make DESTDIR="${pkgdir}" install
}

# vim: set ts=2 sw=2 ft=sh noet:
