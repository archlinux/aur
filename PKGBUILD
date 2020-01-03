# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=openfodder-git
pkgver=1.6.0_2_ga656e77
pkgrel=1
pkgdesc="An open source version of the Cannon Fodder engine, for modern operating systems"
arch=('i686' 'x86_64')
url="http://openfodder.com/"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer')
makedepends=('git' 'clang')
conflicts=('openfodder')
provides=('openfodder')
install=${pkgname}.install
source=(git+"https://github.com/OpenFodder/openfodder.git")
md5sums=('SKIP')

pkgver() {
  cd openfodder
  git describe --tags | sed -e 's:^v::' -e 's:-:_:g'
}

prepare() {
  cd openfodder
  git submodule init
  git submodule update
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
