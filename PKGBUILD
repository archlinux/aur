# Maintainer: osch <oliver@luced.de>

pkgname=audacity-wxgtk2
pkgver=2.4.2
pkgrel=1
pkgdesc="Record and edit audio files"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=('libmad' 'libid3tag' 'wxgtk2' 'glib2' 'soundtouch' 'ffmpeg' 'vamp-plugin-sdk'
'portsmf' 'portmidi' 'twolame' 'suil' 'lilv' 'lv2' 'serd' 'sord' 'sratom' 'python'
'flac' 'libvorbis' 'libogg' 'vamp-plugin-sdk' 'portaudio' 'libsoxr' 'libsndfile' 'lame'
'expat')
makedepends=('cmake' 'autoconf' 'automake' 'libtool')
provides=("audacity")
conflicts=("audacity")
source=("https://github.com/audacity/audacity/archive/Audacity-${pkgver}.tar.gz")
sha512sums=('0d9cdabf5ba2c7207e8d8e4a8bdfc3e7d32277386436ecb480e3ff781720f5449a56b310ba91c78ca67afb752e2ab736abd5b7ce40d19d153bfc4a2067343a3d')

prepare() {
  mv -v "audacity-Audacity-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -Daudacity_use_ffmpeg=loaded ..
}

build() {
  cd "${pkgname}-${pkgver}"/build
  make
}

package() {
  cd "${pkgname}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}
