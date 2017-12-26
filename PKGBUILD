# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr> 
# Contributor: Manuel Kehl <https://launchpad.net/~mank319, https://github.com/mank319/>

pkgname=go-for-it
pkgver=1.6.3
pkgrel=1
pkgdesc='A stylish to-do list with built-in productivity timer.'
arch=('i686' 'x86_64')
url='https://github.com/mank319/Go-For-It'
license=('GPL3')
depends=('gtk3' 'libnotify')
optdepends=()
makedepends=('vala' 'cmake' 'intltool')
conflicts=('go-for-it-git' 'go-for-it-bzr')
source=(${pkgver}.tar.gz::https://github.com/mank319/Go-For-It/archive/${pkgver}.tar.gz)
sha256sums=('8299f2d6d5bfb13b7696b387d52a033101b4f2c303eab768c5c4f8daabb18b67')

build() {
  cd Go-For-It-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
  make pot
  make po
}

package() {
  cd Go-For-It-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
