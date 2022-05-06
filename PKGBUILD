# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=feathernotes
pkgname=$_pkgname-git
pkgver=0.10.0.14.g9cb610a
pkgrel=1
pkgdesc='Lightweight Qt hierarchical notes-manager for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/feathernotes'
license=('GPL3')
depends=('qt6-svg' 'shared-mime-info' 'desktop-file-utils' 'hunspell')
makedepends=('git' 'cmake' 'qt6-tools')
optdepends=('qt6-translations: localized keyboard shortcuts')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:^V::;s:-:.:g'
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake $srcdir/$_pkgname/ -DENABLE_QT5=OFF
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
