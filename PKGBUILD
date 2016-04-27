# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Glen Oakley <goakley123@gmail.com>

_pkgname=cool-retro-term
pkgname=$_pkgname-git
pkgver=1.0.0.r42.gd345be2
pkgrel=2
pkgdesc='A good looking terminal emulator which mimics the old cathode display'
arch=('i686' 'x86_64')
url='https://github.com/Swordfish90/cool-retro-term'
license=('GPL3')
depends=('qmltermwidget' 'qt5-quickcontrols' 'qt5-graphicaleffects')
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
