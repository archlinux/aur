# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=mingw-w64-frei0r-plugins
_pkgname=frei0r-plugins
pkgver=2.5.2
pkgrel=1
pkgdesc='Collection of video effect plugins (mingw-w64)'
arch=(any)
url='https://frei0r.dyne.org/'
license=(GPL-2.0-or-later)
depends=(
  mingw-w64-crt
)
options=(!strip !buildflags staticlibs !debug)
makedepends=(
  mingw-w64-gcc
  mingw-w64-cairo
  mingw-w64-cmake
  mingw-w64-gavl
  mingw-w64-opencv
  git
)
optdepends=(
  'mingw-w64-cairo: cairoaffineblend, cairoblend, cairogradient, cairoimagegrid and mirr0r plugins'
  'mingw-w64-gavl: rgbparade, scale0tilt and vectorscope plugins'
  'mingw-w64-opencv: facebl0r and facedetect plugins'
)
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver")
b2sums=(82a06b4885cfb29c2e9274c32e83b157bfa714e998c9036dd4a3cc6697653ed5106a3886a85a619ac179508644e098fd3951578677cecfd6e01061b21e63d171)
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
