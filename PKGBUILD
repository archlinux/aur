# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: goodguy <lists.cinelerra-gg.org>

pkgname=cinelerra-gg
_pkgver=2026-08
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Professional video editing and compositing environment"
arch=(x86_64)
url="https://www.cinelerra-gg.org"
license=(GPL-2.0-only)
depends=(
    alsa-lib
    aom dav1d
    at-spi2-core
    bzip2
    cairo
    fftw
    flac
    fontconfig
    freetype2
    gdk-pixbuf2
    giflib
    glib2
    glibc
    glu
    gtk2
    harfbuzz
    imath
    jbigkit
    lcms2
    libavc1394
    libdv
    libgcc
    libglvnd
    libiec61883
    libjpeg-turbo
    libogg
    libpng
    libpulse
    libsndfile
    libstdc++
    libtheora
    libtiff
    libusb
    libva
    libvdpau
    libvorbis
    libvpx
    libwebp
    libx11
    libxext
    libxfixes
    libxft
    libxinerama
    libxv
    numactl
    openexr
    opus
    pango
    perl
    sh
    xz
    zlib
    )
makedepends=(
    cmake
    ctags
    git
    libxml2
    nasm
    perl-xml-libxml
    perl-xml-parser
    python
    xorg-mkfontdir
    xorg-mkfontscale
    yasm
    )
conflicts=(cin)
source=("cinelerra-gg::git+https://git.cinelerra-gg.org/goodguy/cinelerra.git#tag=${_pkgver}")
sha256sums=('4f0858976603bdee6661db1dae8046b755ae944135ef54ed6917a368e83eefe2')

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
