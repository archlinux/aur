# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=notcurses
pkgver=1.2.1
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
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
  make
}

check() {
  cd "${pkgname}-${pkgver}/build"
  make test
}

package() {
  cd "${pkgname}-${pkgver}/build"
  env PYROOT=/usr make install
}

sha256sums=('27f89e61d39afb6b937e2fd9c097e9962b198844e9afe541ead348ff1499af5d')
