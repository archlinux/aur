# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: goodguy <lists.cinelerra-gg.org>

pkgname=cinelerra-gg
pkgver=5.1.20200731
pkgrel=1
pkgdesc="Professional video editing and compositing environment"
arch=(x86_64)
url="https://www.cinelerra-gg.org"
license=(GPL2)
depends=(gtk2 libvorbis libavc1394 alsa-lib dav1d openexr
         flac libxv libtheora fftw libvpx libpulse opus
         libva libjpeg-turbo libvdpau aom numactl glu
         mjpegtools openjpeg2 a52dec lame twolame
         x264 x265 libogg libvorbis ffnvcodec-headers
         audiofile ladspa lv2 lilv libsndfile ffmpeg)
# sratom serd sord suil
makedepends=(nasm yasm libtool cmake xorg-mkfontdir xorg-mkfontscale
             libxml2 perl-xml-libxml perl-xml-parser python2)
options=(!strip)
source=("https://www.cinelerra-gg.org/download/pkgs/src/cin_$pkgver-src.tgz")
sha256sums=('d2ba83ca366ff2954935a9604f597b4609fd1cf3c4e931e0f544e514b251018f')

prepare() {
  cd "${srcdir}/cinelerra-5.1"
  sed -i 's/\<python\>/python2.7/' ./guicast/Makefile
  ./autogen.sh
}

build() {
  cd "${srcdir}/cinelerra-5.1"
  ./configure \
    --prefix=/usr \
    --with-exec-name=cinelerra-gg
  make -j1
}

package() {
  cd "${srcdir}/cinelerra-5.1"
  make -j1 install DESTDIR="$pkgdir"
}
