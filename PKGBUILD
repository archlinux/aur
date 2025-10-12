# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=mingw-w64-frei0r-plugins
_pkgname=frei0r-plugins
pkgver=2.5.0
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
  ninja
)
optdepends=(
  'mingw-w64-cairo: cairoaffineblend, cairoblend, cairogradient and cairoimagegrid plugins'
  'mingw-w64-gavl: rgbparade, scale0tilt and vectorscope plugins'
  'mingw-w64-opencv: facebl0r and facedetect plugins'
)
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver")
b2sums=(7f51c27cec02b3bd86e3054d0a56f07ad4785ab4d1aa742663947ce7e497912782c6085e969847b4f6cf1b3ca9055743b11d48bad628874ba3e8385ef34f5430)
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S frei0r -B build-${_arch} -G Ninja
    cmake --build build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
  done
}
