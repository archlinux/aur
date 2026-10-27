# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=dragon-media-backend
pkgver=0.82.1
pkgrel=1
pkgdesc='Qt C++ library intended for desktop music players'
url="https://invent.kde.org/libraries/$pkgname"
arch=($CARCH)
license=(BSD-3-Clause)
depends=(ffmpeg kissfft sdl3 kcoreaddons ki18n kio qt6-base qt6-declarative)
optdepends=('libpipewire: PipeWire integration'
            'libpulse: PulseAudio integration')
makedepends=(git extra-cmake-modules libpipewire libpulse)
source=("$url/-/archive/v$pkgver/dragon-media-backend-v$pkgver.tar.gz"
         https://raw.githubusercontent.com/mborgerding/kissfft/refs/heads/master/kissfft.hh) # The kissfft package is missing this header
sha256sums=('c2ab06a44568092888d28be75090dc2020fdb710b71ccf80979cb50a67f850c0'
            '0a31467599b981d784f53a944c19e6991aa96eee703ab424d648e436b2718a8d')

build() {
  cmake -B build -S $pkgname-v$pkgver \
    -DCMAKE_CXX_FLAGS="-I$srcdir" # Include the missing header
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
