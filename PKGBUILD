# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=musikcube
pkgver=3.0.2
pkgrel=1
pkgdesc='A terminal-based cross-platform music player, audio engine, metadata indexer, and server'
arch=('x86_64')
url="https://github.com/clangen/${pkgname}"
license=('BSD-3-Clause')
depends=('faad2' 'libogg' 'libvorbis' 'flac' 'libmicrohttpd' 'lame' 'ncurses' 'libpipewire' 'pulseaudio' 'libpulse' 'libev' 'alsa-lib' 'curl' 'ffmpeg' 'taglib' 'libgme')
makedepends=('asio' 'cmake' 'patchelf')
optdepends=('libopenmpt: OpenMPT support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('65f82db36d635bdbfd99f67d1d68c9e1aedf8e38efa627f303cf7971c306d063')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i 's/itemListMap/itemMap/' src/plugins/taglib_plugin/TaglibMetadataReader.cpp
}

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
