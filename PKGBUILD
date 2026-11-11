# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=dragon-media-backend
pkgver=0.90.0
pkgrel=1
pkgdesc='Qt C++ library intended for desktop music players'
url="https://invent.kde.org/libraries/$pkgname"
arch=($CARCH)
license=(BSD-3-Clause)
depends=(ffmpeg kissfft sdl3 kcoreaddons ki18n kio qt6-base qt6-declarative)
optdepends=('libpipewire: PipeWire integration'
            'libpulse: PulseAudio integration')
makedepends=(extra-cmake-modules libpipewire libpulse)
source=("$url/-/archive/v$pkgver/dragon-media-backend-v$pkgver.tar.gz"
         https://github.com/mborgerding/kissfft/blob/f3fd3a58f1b98972d0f06a1db775a984198cb788/kissfft.hh) # The kissfft package is missing this header
sha256sums=('023436aaca935a570a825bb2981f79c0c03cfa35402728f46210c5c0de6dfc31'
            '0a31467599b981d784f53a944c19e6991aa96eee703ab424d648e436b2718a8d')

build() {
  cmake -B build -S $pkgname-v$pkgver \
    -DCMAKE_CXX_FLAGS="-I$srcdir" # Include the missing header
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
