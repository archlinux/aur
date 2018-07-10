# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
# Contributor: Stefano Bergamini
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=focuswriter
pkgname=focuswriter-git
pkgver=1116.172a5e3
pkgrel=1
pkgdesc="A simple fullscreen word processor"
arch=('i686' 'x86_64')
url="http://gottcode.org/${_pkgname}/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'hunspell' 'hicolor-icon-theme')
makedepends=('qt5-tools')
optdepends=('sdl_mixer: typewriter sound effects')
makedepends=('git')
provides=('focuswriter')
conflicts=('focuswriter')
source=("git+https://github.com/gottcode/focuswriter.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf %s.%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
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
