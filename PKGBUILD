# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: pingplug < aur at pingplug dot me >

pkgname=cinelerra-gg-git
pkgver=2026.08.r0.ga96d27fe
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
conflicts=(cinelerra-gg cin)
source=("cinelerra-gg::git+https://git.cinelerra-gg.org/goodguy/cinelerra.git")
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
