# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=imageburner-git
pkgver=0.1.15.r6.gae7a78c
pkgrel=1
pkgdesc="Image burner for Pantheon, developed by Artem Anufrij"
arch=('x86_64')
url='https://artemanufrij.github.io/'
license=('GPL3')
depends=('libgranite.so' 'gtk3')
makedepends=('cmake' 'vala' 'cmake-modules-elementary-git' 'git')
provides=(imageburner)
conflicts=(imageburner)
source=("${pkgname}::git+https://github.com/artemanufrij/imageburner.git")
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
