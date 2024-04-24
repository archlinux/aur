# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Co-Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=screengrab
pkgname=$_pkgname-git
pkgver=2.8.0.r1.g400be37
pkgrel=1
pkgdesc="Crossplatform tool for grabbing screenshots of your desktop."
arch=("i686" "x86_64")
url="https://github.com/lxqt/screengrab"
license=("GPL-2.0-only")
depends=('kwindowsystem' 'libqtxdg-git' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt6-tools')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make install DESTDIR="$pkgdir"
}
