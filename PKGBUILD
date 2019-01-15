# Maintainer: Miodrag Tokić
# Contributor: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Manuel Kehl <https://launchpad.net/~mank319, https://github.com/mank319/>

pkgname=go-for-it
pkgver=1.6.8
pkgrel=1
pkgdesc='A stylish to-do list with built-in productivity timer.'
arch=('i686' 'x86_64')
url='https://github.com/mank319/Go-For-It'
license=('GPL3')
depends=('gtk3' 'libnotify')
makedepends=('vala' 'cmake' 'intltool')
conflicts=('go-for-it-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mank319/Go-For-It/archive/${pkgver}.tar.gz")
sha256sums=('4dbb12e521948b7f306e5a611b9a79126864bf5c8af1c1fd13b09ce1bfe88546')

build() {
  cd "Go-For-It-$pkgver"

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
  cd "Go-For-It-$pkgver/build"

  make DESTDIR="$pkgdir" install
}
