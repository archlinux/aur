# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=lives
pkgver=2.8.3
pkgrel=1
pkgdesc="A Video Editing System"
arch=('i686' 'x86_64')
url="http://lives-video.com"
license=('GPL')
depends=('mplayer' 'imagemagick' 'gtk3' 'sox' 'libvisual' 'liboil' 'mjpegtools' 'python' 'ffmpeg2.8' 'jack' 'fftw')
optdepends=('xorg-utils' 'sdl' 'libogg' 'mkvtoolnix-cli' 'libmatroska' 'ogmtools' 'libavc1394' 'dvgrab' 'cdrkit' 'lame' 'youtube-dl' 'opencv')
makedepends=('automake')
options=(!emptydirs)
changelog=lives.changelog
source=(http://lives-video.com/releases/LiVES-$pkgver.tar.bz2 disable-toonz.patch)
md5sums=('77c63dab400491cfcd762823c34d1c61' 'dffab836d4dc5a277c67450e2b1b810b')

prepare() {
  cd ${pkgname}-${pkgver}
  # with opencv installed, toonz.cpp failes to build
  patch -p1 -i "${srcdir}/disable-toonz.patch"
  automake
}

build() {
  cd ${pkgname}-${pkgver}
  PKG_CONFIG_PATH=/usr/lib/ffmpeg2.8/pkgconfig\
    ./configure --prefix=/usr --enable-turbo --disable-doxygen
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
