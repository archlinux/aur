# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=feathernotes
pkgname=$_pkgname-git
pkgver=1.2.0.r5.gb7dcf80
pkgrel=1
pkgdesc='Lightweight Qt hierarchical notes-manager for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/feathernotes'
license=('GPL-3.0-only')
depends=('qt6-svg' 'shared-mime-info' 'desktop-file-utils' 'hunspell')
makedepends=('git' 'cmake' 'qt6-tools')
optdepends=('qt6-translations: localized keyboard shortcuts')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:^V::;s:-:.r:;s:-:.:'
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake $srcdir/$_pkgname/
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
