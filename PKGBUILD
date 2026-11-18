# SPDX-FileCopyrightText: 2026 Pavel Ruzicka
# SPDX-License-Identifier: 0BSD
# Maintainer: Pavel Ruzicka <rossettidesign at gmail dot com>

pkgname=qsampleman
pkgver=0.1.0
pkgrel=1
pkgdesc='Browse, inspect and audition audio samples (WAV): format, loops, root key, waveform'
arch=('x86_64')
url='https://gitlab.com/rossettidesignsw/musicutility/qsampleman'
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base' 'qt6-multimedia')
makedepends=('cmake' 'ninja')
optdepends=('qt6-svg: sharp application icon in the windows (otherwise 64 px)'
            'audacity: default external sample editor')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a819680d0774fb0eb479a471c88c0214adc0d07ad8888937d1d5571208ea9a69')

build() {
  cmake -B build -S "$pkgname-v$pkgver" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DOCDIR=share/doc/$pkgname \
    -Wno-dev
  cmake --build build
}

check() {
  QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
