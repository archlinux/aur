# Maintainer: Dylan Simowitz <aur@dylan.simowitz.com>

pkgname="hello-kde-git"
_pkgname="hello"
pkgver=r51.ee0a53b
pkgrel=1
pkgdesc="hello. is a compilation of various color-schemes, themes, icons and more for the KDE Plasma desktop. It is unopinionated, putting you in charge."
arch=('i686' 'x86_64')
url="https://github.com/n4n0GH/hello"
license=('GPL2')
depends=('kwin')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kdecoration' 'qt5-tools')
source=('git+https://github.com/n4n0GH/hello.git')
md5sums=('SKIP')
provides=('hello-kde')

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
