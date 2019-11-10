# Maintainer: Dylan Simowitz <aur@dylan.simowitz.com>

pkgname="breezeway-mod-git"
_pkgname="breezeway-mod"
pkgver=r65.17b8cc6
pkgrel=1
pkgdesc="BreezewayMod is a fork of the Breezeway window decoration which aims to mimic the macOS interface."
arch=('i686' 'x86_64')
url="https://github.com/n4n0GH/breezeway-mod"
license=('GPL2')
depends=('kwin')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kdecoration')
source=('git+https://github.com/n4n0GH/breezeway-mod.git')
md5sums=('SKIP')
provides=('breezeway-mod')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
