# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=hashit-git
pkgver=0.1.11.r0.g6261c98
pkgrel=1
pkgdesc="Checksum tool for Pantheon, developed by Artem Anufrij"
arch=('x86_64')
url='https://artemanufrij.github.io/'
license=('GPL3')
depends=('libgranite.so' 'gtk3')
makedepends=('vala' 'cmake' 'cmake-modules-elementary-git' 'git')
provides=(hashit)
conflicts=(hashit)
source=("${pkgname}::git+https://github.com/artemanufrij/hashit.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  install -d build
}

build() {
  cd "${pkgname}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
