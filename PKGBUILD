# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=notcurses
pkgver=1.2.4
pkgrel=1
pkgdesc="Modern TUI library"
url="https://nick-black.com/dankwiki/index.php/Notcurses"
license=('Apache')
arch=('x86_64')
depends=('ncurses' 'ffmpeg')
makedepends=('cmake' 'pandoc' 'python-cffi' 'python-setuptools' 'doctest')
source=("https://github.com/dankamongmen/notcurses/archive/v${pkgver}.tar.gz")

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DUSE_PYTHON=OFF
}

build() {
  cd "${pkgname}-${pkgver}/build"
  make
}

check() {
  cd "${pkgname}-${pkgver}/build"
  make test
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make install DESTDIR="$pkgdir"
}

sha256sums=('96026113db7196d377e4577ec6087c4dfa6198e24f03e36462d2348d8b54d893')
