# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: pingplug < aur at pingplug dot me >

pkgname=cinelerra-gg-git
pkgver=2024.12.r3.g83c3752b
pkgrel=2
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
makedepends=(cmake ctags git libxml2 nasm perl-xml-libxml
             perl-xml-parser python xorg-mkfontdir
             xorg-mkfontscale yasm)
provides=(cinelerra-gg)
conflicts=(cinelerra-gg cin)
source=("cinelerra-gg::git://git.cinelerra-gg.org/goodguy/cinelerra.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/cinelerra-gg/cinelerra-5.1"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
