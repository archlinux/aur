# Maintainer: Adam Perkowski <adas1per@protonmail.com>

# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Glen Oakley <goakley123@gmail.com>

_pkgname=cool-retro-term
pkgname=$_pkgname-git
pkgver=1.2.0+rf157648
pkgrel=1
pkgdesc='A good looking terminal emulator which mimics the old cathode display - git version'
arch=('i686' 'x86_64')
url="https://github.com/Swordfish90/$_pkgname"
license=('GPL-3.0')
depends=('hicolor-icon-theme' 'qt5-declarative')
makedepends=('git' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qmltermwidget-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/Swordfish90/$_pkgname")
sha256sums=(SKIP)

pkgver () {
  cd $_pkgname
  echo "$(git describe --tags --abbrev=0)+r$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  sed -i '/qmltermwidget/d' cool-retro-term.pro
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
