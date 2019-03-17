# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=feathernotes
pkgname=$_pkgname-git
pkgver=r15.44ff069
pkgrel=1
pkgdesc='Lightweight Qt hierarchical notes-manager for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/FeatherNotes'
license=('GPL3')
depends=('qt5-x11extras' 'qt5-svg' 'shared-mime-info' 'desktop-file-utils')
makedepends=('git')
optdepends=('qt5-translations: localized keyboard shortcuts')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/tsujan/FeatherNotes.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  rm -Rf build && mkdir build
  cd build
  qmake $srcdir/$_pkgname/ CONFIG+=debug
  make
}

package() {
  cd build
  make INSTALL_ROOT=$pkgdir install
}
