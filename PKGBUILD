# Maintainer: osch <oliver@luced.de>

pkgname=audacity-wxgtk2
pkgver=2.3.2
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
sha512sums=('a59d6e9e974d5f78f5ca561e3bea31fc1b3e88f9ea60b2df7ce8bcec264d886f3fdc8f20030e11a86daff8ffeb735850b5e5f73c45fbef0bfcc58692423e7cd0')

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
