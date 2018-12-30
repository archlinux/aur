# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=musikcube
pkgver=0.60.0
pkgrel=2
pkgdesc='A terminal-based cross-platform music player, audio engine, metadata indexer, and server'
arch=('x86_64')
url="https://github.com/clangen/${pkgname}"
license=('BSD')
conflicts=("${pkgname}-git")
depends=('faad2' 'libogg' 'libvorbis' 'flac' 'libmicrohttpd' 'lame' 'ncurses' 'boost-libs' 'pulseaudio' 'libpulse' 'libev' 'alsa-lib' 'curl')
makedepends=('cmake' 'boost')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('50062de3f997137611f0341b343056a0515a2685e671ae05e04ca48999365b2b')

build() {
  cd "${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
