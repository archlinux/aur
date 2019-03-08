# Maintainer: osch <oliver@luced.de>

pkgname=audacity-wxgtk2
pkgver=2.3.1
pkgrel=1
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
sha512sums=('066f57bd90d2baea6969f0cbfb63e41a42ed6dac955d87dc7b601c7a270888363e414c57e36393618801ea31b1068b7b22003f52897bf9a44fbc355aaf23cbaa')

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
