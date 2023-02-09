pkgname=mingw-w64-libva
pkgdesc="Video Acceleration (VA) API for Linux (mingw-w64)"
pkgver=2.17.0
pkgrel=1
arch=('any')
makedepends=('mingw-w64-meson')
url="https://01.org/linuxmedia/vaapi"
license=('MIT')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/intel/libva/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8940541980ef998a36cd8f6ad905e81838ea4ddf56dc479ed2bebd12711e6001')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libva-$pkgver
  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch}
    ninja -C build-${_arch} ${MAKEFLAGS}
  done
}

package() {
  cd libva-$pkgver
  for _arch in ${_architectures}; do
     DESTDIR="$pkgdir" ninja -C build-${_arch} install
  done
}
