# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=mingw-w64-frei0r-plugins
_pkgname=frei0r-plugins
pkgver=3.0.0
pkgrel=1
pkgdesc='Collection of video effect plugins (mingw-w64)'
arch=(any)
url='https://frei0r.dyne.org/'
license=(GPL-2.0-or-later)
depends=(
  mingw-w64-cairo
  mingw-w64-crt
  mingw-w64-gavl
  mingw-w64-opencv
)
options=(!strip !buildflags staticlibs !debug)
makedepends=(
  mingw-w64-gcc
  mingw-w64-cmake
  git
)
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver")
b2sums=('4ef72aa8cc09e16d93780e1d71e4bb5d01e9c53393bbc6e1394b399c29f28ed6d9bc53f3dcb5899181075d0cdc22f5fbd287c29e8cde030c465672eef3cad654')
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S frei0r -B build-${_arch}
    cmake --build build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
  done
}
