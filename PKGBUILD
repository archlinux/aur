# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr> 
# Contributor: Manuel Kehl <https://launchpad.net/~mank319, https://github.com/mank319/>

pkgname=go-for-it
pkgver=1.4.6
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
source=(release_${pkgver}.tar.gz::https://codeload.github.com/mank319/Go-For-It/tar.gz/release_${pkgver})
sha256sums=('cb4db45577ee6469d0160c94ccff04cb02bf64167db71a785aef35443b79ecf0')

prepare() {
  mv ${srcdir}/Go-For-It-release_${pkgver}/* ${srcdir}/
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