# Maintainer: Mesmer <mesmer@fisica.if.uff.br>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: aldelaro5 <aldelaro5@gmail.com>

_pkgbase='decaf-emu'
pkgname="$_pkgbase-git"
pkgver=r3319.782e530e
pkgrel=1
pkgdesc="An experimental open-source Nintendo Wii U emulator"
arch=('x86_64')
url="https://github.com/decaf-emu/decaf-emu"
license=('GPL')
depends=('zlib' 'sdl2')
makedepends=('git' 'cmake')
source=("$_pkgbase::git+https://github.com/decaf-emu/decaf-emu")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  mkdir -p build
  git submodule update --init
}

build() {
  cd "$srcdir/$_pkgbase"
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgbase/build"
  make DESTDIR="$pkgdir/" install
}
