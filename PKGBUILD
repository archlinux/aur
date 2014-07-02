# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
pkgver=1.1.6
pkgrel=1
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications (32 bit, library only)"
arch=('x86_64')
url="http://www.fluidsynth.org/"
depends=("${pkgname#*-}=$pkgver" 'lib32-glib2' 'lib32-jack' 'lib32-libpulse' 'lib32-alsa-lib')
makedepends=('cmake' 'lib32-ladspa' 'gcc-multilib')
optdepends=('pulseaudio: PulseAudio sound support')
license=('LGPL')
source=("http://downloads.sourceforge.net/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz")
sha256sums=('50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d96b5bccee2171c')

build() {
  cd ${pkgname#*-}-$pkgver

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -Denable-ladspa=ON \
          -DLIB_SUFFIX=32
  make
}

package() {
  make -C ${pkgname#*-}-$pkgver DESTDIR="$pkgdir/" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
