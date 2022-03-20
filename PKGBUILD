# -*- shell-script -*-
# Maintainer:  Marco Schroeder <marco.schroeder96 at gmail dot com>
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
pkgname=keeperrl-git
pkgver=r5672
pkgrel=1
pkgdesc="Dungeon Keeper and Dwarf Fortress inspired dungeon simulator built on top of roguelike mechanics."
arch=('i686' 'x86_64')
url="http://keeperrl.com/"
groups=()
license=('GPL')
conflicts=('keeperrl')
#depends=('sfml' 'freeglut' 'angelscript')
depends=('sfml' 'freeglut' 'sdl2_image')
makedepends=('git' 'ctags' 'boost' 'clang')
checkdepends=()
optdepends=()
backup=()
options=()
install=
changelog=
source=(${pkgname}::'git+https://github.com/miki151/keeperrl.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s" $(git rev-list --count HEAD)
}

build() {
  cd "${srcdir}/${pkgname}"
  make NO_STEAMWORKS=true RELEASE=true ENABLE_LOCAL_USER_DIR=true DATA_DIR=/usr/share/keeperrl
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 keeper "$pkgdir/usr/bin/keeperrl"
  install -Dm644 appconfig.txt -t "$pkgdir/usr/share/keeperrl"
  cp -a data* "$pkgdir/usr/share/keeperrl/"
}

