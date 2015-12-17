# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr> 
# Contributor: Manuel Kehl <https://launchpad.net/~mank319, https://github.com/mank319/>

pkgname=go-for-it
pkgver=1.4
pkgrel=1
pkgdesc='A stylish to-do list with built-in productivity timer.'
arch=('i686' 'x86_64')
url='https://github.com/mank319/Go-For-It'
license=('GPL3')
depends=('gtk3' 'libnotify')
optdepends=()
makedepends=('vala' 'cmake')
conflicts=('go-for-it-git' 'go-for-it-bzr')
install=go-for-it.install
source=(https://github.com/mank319/Go-For-It/archive/release_v1.4.tar.gz)
sha256sums=('76201c6c047f8d3e3f86d0a607b4e2f0f723007e7ed3a0f778bcf3fe0e39c85b')

prepare() {
  mv ${srcdir}/Go-For-It-release_v${pkgver}/* ${srcdir}/
}

build() {
  cd ${srcdir}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et: