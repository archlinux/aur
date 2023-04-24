# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=openfodder
pkgver=1.7.0
pkgrel=1
pkgdesc="An open source version of the Cannon Fodder engine, for modern operating systems"
arch=('i686' 'x86_64')
url="http://openfodder.com/"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer')
makedepends=('git' 'clang')
install=${pkgname}.install
source=(git+"https://github.com/OpenFodder/openfodder.git#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
  cd openfodder
  git submodule init
  git -c protocol.file.allow=always submodule update
}

build() {
  cd openfodder
  make
}

package() {
  cd openfodder/Run

  # Install executable and create terminal-friendly symlink
  install -Dm755 OpenFodder "${pkgdir}/usr/bin/OpenFodder"
  ln -s OpenFodder "${pkgdir}/usr/bin/openfodder"
  rm OpenFodder

  # install data files
  install -dm755 "${pkgdir}/var/lib/OpenFodder"
  cp -r * "${pkgdir}/var/lib/OpenFodder"
}
