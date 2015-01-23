# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Glen Oakley <goakley123@gmail.com>

pkgname=cool-retro-term-git
pkgrel=1
pkgver=1.0.0RC1.r39.g40eb51e
pkgdesc='A good looking terminal emulator which mimics the old cathode display'
arch=('i686' 'x86_64')
url='https://github.com/Swordfish90/cool-retro-term'
license=('GPL3')
depends=('qmltermwidget-git' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'hicolor-icon-theme')
makedepends=('git')
install=${pkgname%-*}.install
source=("git://github.com/Swordfish90/cool-retro-term.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname%-*}"

  sed -i '/qmltermwidget/d' cool-retro-term.pro
}

pkgver () {
  cd "$srcdir/${pkgname%-*}"

  git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-*}"

  qmake
  make
}

package() {
  cd "$srcdir/${pkgname%-*}"

  make INSTALL_ROOT="$pkgdir" install
}
