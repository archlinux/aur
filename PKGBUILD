# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: goodguy <lists.cinelerra-gg.org>

pkgname=cinelerra-gg
_pkgver=2024-12
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Professional video editing and compositing environment"
arch=(x86_64)
url="https://www.cinelerra-gg.org"
license=(GPL-2.0-only)
depends=(alsa-lib aom dav1d fftw flac glu gtk2 libavc1394
         libdv libiec61883 libpulse libtheora libusb libva libvdpau
         libvorbis libvpx libwebp libxv numactl openexr opus

         # namcap implicit depends
         perl libogg libxext freetype2 glib2 at-spi2-core libxft libglvnd libxfixes libsndfile harfbuzz zlib glibc
         libxinerama cairo libx11 fontconfig gdk-pixbuf2 imath pango jbigkit xz bzip2 libjpeg-turbo libpng gcc-libs
         libtiff)
makedepends=(git cmake ctags libxml2 nasm perl-xml-libxml
             perl-xml-parser python xorg-mkfontdir
             xorg-mkfontscale yasm)
conflicts=(cin)
source=("cinelerra-gg::git://git.cinelerra-gg.org/goodguy/cinelerra.git#tag=${_pkgver}")
sha256sums=('9da2ea499dcd987be197c7e08d8bcb8b2f26d8b4ff8306aa50e8eeaf00a4e5df')

prepare() {
  cd "${srcdir}/cinelerra-gg/cinelerra-5.1"
  ./autogen.sh
}

build() {
  cd "${srcdir}/cinelerra-gg/cinelerra-5.1"
  ./configure \
    --prefix=/usr \
    --disable-static-build \
    --without-cuda \
    --with-exec-name=cinelerra-gg
  make -j1
}

package() {
  cd "${srcdir}/cinelerra-gg/cinelerra-5.1"
  make -j1 DESTDIR="${pkgdir}" install
}
