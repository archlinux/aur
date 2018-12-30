# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Glen Oakley <goakley123@gmail.com>

_pkgname=cool-retro-term
pkgname=$_pkgname-git
pkgver=1.1.0.r5.g4046bdb
pkgrel=1
pkgdesc='A good looking terminal emulator which mimics the old cathode display - git version'
arch=('i686' 'x86_64')
url='https://github.com/Swordfish90/cool-retro-term'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'qmltermwidget')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/Swordfish90/cool-retro-term.git")
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  sed -i '/qmltermwidget/d' cool-retro-term.pro
}

pkgver () {
  cd $_pkgname
  git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  qmake
  make
}

package() {
  cd $_pkgname
  make INSTALL_ROOT="$pkgdir" install
}
