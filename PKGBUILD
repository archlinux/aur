# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=musikcube
pkgver=0.97.0
pkgrel=1
pkgdesc='A terminal-based cross-platform music player, audio engine, metadata indexer, and server'
arch=('x86_64')
url="https://github.com/clangen/${pkgname}"
license=('BSD')
depends=('faad2' 'libogg' 'libvorbis' 'flac' 'libmicrohttpd' 'lame' 'ncurses' 'boost-libs' 'pulseaudio' 'libpulse' 'libev' 'alsa-lib' 'curl' 'ffmpeg' 'taglib')
makedepends=('cmake' 'boost')
optdepends=('libopenmpt: OpenMPT support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ab170c5100251fcd6c8fd3c32eea45e9854c6c6272c6b0970bffbfc55d0b2ec5')

build() {
  cd "${pkgname}-${pkgver}"

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
