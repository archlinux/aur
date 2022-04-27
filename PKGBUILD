# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=featherpad
pkgname=$_pkgname-git
pkgver=0.10.0.2.gac3e510
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor for Linux'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/featherpad'
license=('GPL3')
depends=('qt5-svg' 'qt5-x11extras' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('git' 'cmake' 'qt5-tools')
optdepends=('qt5-translations: localized keyboard shortcuts')
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
  cmake $srcdir/$_pkgname/
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
