# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=featherpad
pkgname=$_pkgname-git
pkgver=1.5.1.r6.gd72f662b
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor for Linux'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/featherpad'
license=('GPL-3.0-only')
depends=('qt6-svg' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('git' 'cmake' 'qt6-tools')
optdepends=('qt6-translations: localized keyboard shortcuts')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed "s:^V::;s:-:.r:;s:-:.:"
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake $srcdir/$_pkgname/
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
