# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=cinelerra-gg-git
pkgver=5.1.2020.07.r3.g2951f82f
pkgrel=1
pkgdesc="Professional video editing and compositing environment"
arch=(x86_64)
url="https://www.cinelerra-gg.org"
license=(GPL2)
provides=(cinelerra-gg)
conflicts=(cinelerra-gg)
depends=(gtk2 libvorbis libavc1394 alsa-lib dav1d openexr
         flac libxv libtheora fftw libvpx libpulse opus
         libva libjpeg-turbo libvdpau aom numactl glu
         mjpegtools openjpeg2 a52dec lame twolame
         x264 x265 libogg libvorbis ffnvcodec-headers
         audiofile ladspa lv2 lilv libsndfile ffmpeg)
# sratom serd sord suil
makedepends=(git nasm yasm libtool cmake xorg-mkfontdir xorg-mkfontscale
             libxml2 perl-xml-libxml perl-xml-parser python2)
source=("git://git.cinelerra-gg.org/goodguy/cinelerra.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/cinelerra/cinelerra-5.1"
  echo 5.1.$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

prepare() {
#  patch -Np0 -i dep.patch
  cd "${srcdir}/cinelerra/cinelerra-5.1"
  sed -i 's/\<python\>/python2.7/' ./guicast/Makefile
  ./autogen.sh
}

build() {
  cd "${srcdir}/cinelerra/cinelerra-5.1"
  ./configure \
    --prefix=/usr \
    --disable-static-build \
    --with-exec-name=cinelerra-gg
  make -j1
}

package() {
  cd "${srcdir}/cinelerra/cinelerra-5.1"
  make -j1 DESTDIR="${pkgdir}" install
}
