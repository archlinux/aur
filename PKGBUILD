# $Id$
# Maintainer:  Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mcder3 <mcder3[at]gmail[dot]com>
# Contributor: MisterFred <mister.fred[at]free[dot]fr>

pkgname=cantata-qt4
_basekpkgname=cantata
pkgver=1.5.2
pkgrel=2
pkgdesc='Qt4 client for the music player daemon (MPD)'
arch=('i686' 'x86_64')
url='https://code.google.com/p/cantata/'
license=('GPL')
provides=('cantata')
conflicts=('cantata' 'cantata-svn' 'cantata-kde-svn' 'cantata-kde')
depends=('qt4' 'libmtp' 'libcddb' 'libmusicbrainz5' 'mpg123' 'taglib-extras' 
'hicolor-icon-theme' 'cdparanoia' 'speex' 'media-player-info' 'udisks2')
optdepends=('perl-uri: dynamic playlist' 'mpd: playback' 
'ffmpeg: ReplayGain support')
makedepends=('cmake' 'qt4' 'ffmpeg')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.bz2::https://drive.google.com/uc?export=download&id=0Bzghs6gQWi60LV9rM3RMQk85Z1E")
md5sums=('0b29d30f1b03ecac23eb608309fbeaa1')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../${_basekpkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_HTTP_STREAM_PLAYBACK=ON \
    -DENABLE_KDE=OFF -DENABLE_QT5=OFF \
    -DENABLE_UDISKS2=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

