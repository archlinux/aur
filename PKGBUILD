# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=non-sequencer
pkgver=1.10.0
pkgrel=3
pkgdesc="A powerful, lightweight, real-time, pattern-based MIDI sequencer"
arch=(x86_64)
url="https://non.tuxfamily.org/"
license=(GPL3)
groups=(
  non-daw
  pro-audio
)
depends=(
  cairo
  gcc-libs
  glibc
  hicolor-icon-theme
  libsigc++
  libx11
)
makedepends=(
  jack
  liblo
  ntk
  waf
)
source=(https://github.com/linuxaudio/non/archive/$pkgname-v$pkgver/non-$pkgname-v$pkgver.tar.gz)
sha512sums=('75eb88f15e15ecaf3fe7d82e0a020adf9e8239d2c6da3ff9035d3d8c86a913d7a74c6acc0b7c5fada9f18fc64cb116ed2065f10bc63acbeea9501f9c7309a3ed')
b2sums=('a41d7e42545520501bc2d917d4dcc898a1b14f666f7fb01300ff2086117fb6d5a0d206e3e220a63d1d8087e8a44f97543ecaf88c11bbe4468e532d323c504c3d')

build() {
  cd non-$pkgname-v$pkgver

  export LINKFLAGS="$LDFLAGS"
  CXXFLAGS+=" -std=c++14"
  waf configure --prefix=/usr --project=sequencer --disable-native-cpu-optimization
  waf
}

package() {
  depends+=(
    jack libjack.so
    liblo liblo.so
    ntk libntk.so libntk_images.so
  )

  cd non-$pkgname-v$pkgver
  waf --destdir="$pkgdir" install
}
