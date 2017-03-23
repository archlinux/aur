# Maintainer: Magnus Groß magnus dot gross 21 at gmail dot com
_pkgname=quickcurver
pkgname="$_pkgname"-git
pkgver=VERSION
pkgrel=1
pkgdesc="Qt Material design implementation of Achtung die Kurve with online multiplayer"
arch=('i686' 'x86_64')
url="https://github.com/magnus-gross/$_pkgname"
license=('GPL3')
depends=(qt5-base qt5-declarative qt5-svg qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects)
makedepends=(git)
source=("git+https://github.com/magnus-gross/$_pkgname.git"
		"git+https://github.com/magnus-gross/qml-material")
md5sums=('SKIP'
		'SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.qml-material.url $srcdir/qml-material
  git submodule update
}

build() {
  cd "$_pkgname"
  ./build.sh
}

package() {
  install -D "$srcdir/$_pkgname/build/QuickCurver" "$pkgdir/usr/bin/$_pkgname"
}
