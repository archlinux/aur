# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=musikcube
pkgver=0.93.1
pkgrel=1
pkgdesc='A terminal-based cross-platform music player, audio engine, metadata indexer, and server'
arch=('x86_64')
url="https://github.com/clangen/${pkgname}"
license=('BSD')
conflicts=("${pkgname}-git")
depends=('faad2' 'libogg' 'libvorbis' 'flac' 'libmicrohttpd' 'lame' 'ncurses' 'boost-libs' 'pulseaudio' 'libpulse' 'libev' 'alsa-lib' 'curl' 'ffmpeg' 'taglib')
makedepends=('cmake' 'boost')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e84e060acaab40266cc3d866f50f727c770c42273a5219fff5d6757186dbad21')

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
