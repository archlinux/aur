# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=musikcube
pkgver=0.99.3
pkgrel=1
pkgdesc='A terminal-based cross-platform music player, audio engine, metadata indexer, and server'
arch=('x86_64')
url="https://github.com/clangen/${pkgname}"
license=('BSD')
depends=('faad2' 'libogg' 'libvorbis' 'flac' 'libmicrohttpd' 'lame' 'ncurses' 'pulseaudio' 'libpulse' 'libev' 'alsa-lib' 'curl' 'ffmpeg' 'taglib')
makedepends=('asio' 'cmake')
optdepends=('libopenmpt: OpenMPT support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('584c8225caad46fde83cdd520ef7d4a6633471de9693651f46d520040e9fb51d')

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
