# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=musikcube
pkgver=0.96.13
pkgrel=1
pkgdesc='A terminal-based cross-platform music player, audio engine, metadata indexer, and server'
arch=('x86_64')
url="https://github.com/clangen/${pkgname}"
license=('BSD')
depends=('faad2' 'libogg' 'libvorbis' 'flac' 'libmicrohttpd' 'lame' 'ncurses' 'boost-libs' 'pulseaudio' 'libpulse' 'libev' 'alsa-lib' 'curl' 'ffmpeg' 'taglib')
makedepends=('cmake' 'boost')
optdepends=('libopenmpt: OpenMPT support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ea9ebbeb7f15aa06c1e4823240011a172c241ed25d4106677237be157abd1d0a')

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
