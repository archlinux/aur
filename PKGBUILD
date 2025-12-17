# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=openfodder
pkgver=2.0.0
pkgrel=1
pkgdesc="An open source version of the Cannon Fodder engine, for modern operating systems"
arch=('i686' 'x86_64')
url="http://openfodder.com/"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'sdl2' 'sdl2_mixer')
makedepends=('git' 'clang')
install=${pkgname}.install
source=(git+"https://github.com/OpenFodder/openfodder.git#tag=${pkgver}")
md5sums=('053e755e5268735c1963dc2cff5c0544')

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
