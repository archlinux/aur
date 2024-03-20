# Maintainer: Dominik Kummer <admin@arkades.org>
pkgname=somafm-qt-git
_pkgname=somafm-qt
pkgver=v0.1.r19.g0179f9c
pkgrel=1
pkgdesc="A player for somafm.com radio channels written in qt5/c++"
url="http://www.github.com/josefbehr/somafm-qt"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-base' 'qt5-multimedia')
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
source=("git+https://github.com/josefbehr/somafm-qt.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/ver_//;s/_/./g;s/-/.r/;s/-/./'
}

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  qmake
  make
}

package() {
  cd "$_pkgname"
  install -D somafm-qt "$pkgdir/usr/bin/somafm-qt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
