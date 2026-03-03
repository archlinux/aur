# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=mingw-w64-frei0r-plugins
_pkgname=frei0r-plugins
pkgver=2.5.5
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
b2sums=('ff58f433e68a9fa72cd9f3af215b260f7a55e290c08c8300f3ba05252895fddf80931bafc195af6422f85fdb0c7a81ea2a94ee20103e2cced1900bb0ac2956f2')
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
