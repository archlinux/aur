# Maintainer: osch <oliver@luced.de>

pkgname=audacity-wxgtk2
pkgver=2.2.2
pkgrel=3
pkgdesc="Record and edit audio files"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=('libmad' 'libid3tag' 'wxgtk2' 'soundtouch' 'ffmpeg' 'vamp-plugin-sdk'
'portsmf' 'twolame' 'suil' 'lilv')
makedepends=('cmake')
provides=("audacity")
conflicts=("audacity")
source=("https://github.com/audacity/audacity/archive/Audacity-${pkgver}.tar.gz")
sha512sums=('311a5f3413e7faf40dc5639b2b9f8b0d03d1a410c50d894ca7abf3fe5733a29b710ccf7e3215d97dd9142e93c0ab5e13955dfd13146b03f927f74465459a6457')

prepare() {
  mv -v "audacity-Audacity-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  autoreconf -vi
}

build() {
  cd "${pkgname}-${pkgver}"
  WX_CONFIG=wx-config ./configure --prefix="/usr" \
    --with-libsndfile="system" \
    --with-ffmpeg="system" \
    --with-expat="system" \
    --with-lame="system" \
    --with-libsoxr="system" \
    --with-libflac \
    --with-libid3tag \
    --with-libsamplerate \
    --with-sbsms \
    --with-soundtouch \
    --with-libtwolame \
    --with-libvorbis \
    --with-lv2 \
    --with-portaudio \
    --with-portmidi
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
sha512sums=('311a5f3413e7faf40dc5639b2b9f8b0d03d1a410c50d894ca7abf3fe5733a29b710ccf7e3215d97dd9142e93c0ab5e13955dfd13146b03f927f74465459a6457')
