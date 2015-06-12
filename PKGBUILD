# Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
# Contributor: Stefano Bergamini

_pkgname=focuswriter
pkgname=focuswriter-git
pkgver=1.5.0.68.gfd226d2
pkgrel=1
pkgdesc="A simple fullscreen word processor"
arch=('i686' 'x86_64')
url="http://gottcode.org/${_pkgname}/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'hunspell')
optdepends=('sdl_mixer: typewriter sound effects')
makedepends=('git')
provides=('focuswriter')
conflicts=('focuswriter')
install=${pkgname}.install
source=("git://github.com/gottcode/focuswriter.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="${pkgdir}/" install
}
