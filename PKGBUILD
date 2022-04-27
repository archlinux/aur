# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=featherpad
pkgname=$_pkgname-git
pkgver=1.2.0.2.g352c6aa
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor for Linux'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/featherpad'
license=('GPL3')
depends=('qt6-svg' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('git' 'cmake' 'qt6-tools')
optdepends=('qt6-translations: localized keyboard shortcuts')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed "s:^V::;s:-:.:g"
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake $srcdir/$_pkgname/ -DENABLE_QT5=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
