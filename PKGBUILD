# Maintainer: Stanislaw Grams <stanislawgrams@gmail.com>
pkgname=wireless-info-icon-git
pkgver=20231225
pkgrel=1
pkgdesc=" Tray icon with Wi-Fi signal power level information and control (rx and tx)."
arch=('any')
url="https://github.com/kkonradpl/wireless-info-icon"
license=('GPL2')
depends=('qt5')
provides=('wireless-info-icon')
conflicts=('wireless-info-icon')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'qt5')
source=("git+https://github.com/kkonradpl/wireless-info-icon/")
md5sums=('SKIP')
_gitname="wireless-info-icon"

prepare () {
  cd "$srcdir/$_gitname"
  git submodule init
  git submodule update
}

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname/build"
  cmake .. -GNinja -Wall -DCMAKE_INSTALL_PREFIX='/usr'
  ninja
}

package() {
  cd "$srcdir/$_gitname/build"
  DESTDIR="$pkgdir" ninja install
}
