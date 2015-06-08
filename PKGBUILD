#Maintainer: Øyvind 'MrElendig' Heggstad <mrelendig@har-ikkje.net>
#Contributor: jsteel <mail at jsteel dot org>

pkgname=moc-svn
pkgver=2758
pkgrel=1
pkgdesc='A powerful & easy to use console audio player'
url="http://moc.daper.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file')
source=('moc::svn://daper.net/moc/trunk')
sha1sums=('SKIP')
makedepends=('speex' 'ffmpeg' 'taglib' 'libmpcdec' 'wavpack'
             'libmodplug' 'subversion' 'sidplay2' 'faad2')
optdepends=('speex: for using the speex plugin'
            'ffmpeg: for using the ffmpeg plugin'
            'taglib: for using the musepack plugin'
            'libmpcdec: for using the musepack plugin'
            'wavpack: for using the wavpack plugin'
            'libmodplug: for using the modplug plugin'
            'sidplay2: for playing c64 sid files'
            'faad2: for use the aac plugin')
conflicts=('moc')
provides=('moc')
options=('!libtool')

pkgver() {
  cd moc
  svnversion
}

build() {
  cd moc
  autoreconf -f -i -Wall,no-obsolete
  ./configure --prefix=/usr --without-rcc \
    --with-alsa --with-jack --with-aac --with-mp3 \
    --with-musepack --with-vorbis --with-flac --with-wavpack \
    --with-sndfile --with-modplug --with-ffmpeg --with-speex \
    --with-samplerate --with-curl --with-sidplay2 --disable-debug
  make
}

package() {
  cd moc
  make DESTDIR="$pkgdir" install
}
