# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: nyanpasu64 <nyanpasu64 at tuta dot io>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=polyphone-git
_basename=${pkgname%-git}
pkgver=2.6.0.beta.r3.c759b7d7
pkgrel=1
pkgdesc="A soundfont editor for quickly designing musical instruments"
arch=(x86_64)
url="https://polyphone-soundfonts.com/en/"
_url=https://github.com/davy7125/polyphone
license=(GPL-3.0-or-later)
groups=(pro-audio)
depends=(
  alsa-lib
  gcc-libs
  glibc
  hicolor-icon-theme
  openssl
  qt6-base
  qt6-svg
  zlib
)
makedepends=(
  git
  jack
  libogg
  libvorbis
  libsndfile
  rtaudio
  rtmidi
  qt6-tools
  stk
)
provides=("${_basename}")
conflicts=("${_basename}")
source=('git+https://github.com/davy7125/polyphone.git')
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
	cd "$srcdir/$_basename"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd ${_basename}/sources
	qmake6 ${_basename}.pro PREFIX=/usr
	make
}

package() {
  depends+=(
    jack libjack.so
    libogg libogg.so
    libsndfile libsndfile.so
    libvorbis libvorbis.so libvorbisenc.so libvorbisfile.so
    stk libstk-5.0.0.so
  )

  cd ${_basename}/sources
  make INSTALL_ROOT="$pkgdir" install
}
