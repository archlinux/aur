# Maintainer: librewish <librewish@gmail.com>

_pkgname=organizer
pkgname=lxqt-organizer-git
pkgver=r76.6cae20f
pkgrel=1
pkgdesc="personal information manager"
arch=("i686" "x86_64")
url="https://lxqt.org"
license=("GPL2")
depends=('qt5-base' 'liblxqt-git')
makedepends=('git' 'cmake' 'qt5-tools' 'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
      cd $_pkgname
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    "$srcdir/$_pkgname"

  make
}

package() {
  cd build

  make DESTDIR="$pkgdir" install
}
