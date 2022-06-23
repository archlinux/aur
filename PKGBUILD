# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: goodguy <lists.cinelerra-gg.org>

pkgname=cinelerra-gg
_pkgver=2022-05
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Professional video editing and compositing environment"
arch=(x86_64)
url="https://www.cinelerra-gg.org"
license=(GPL2)
depends=(alsa-lib aom dav1d fftw flac glu gtk2 libavc1394
         libdv libiec61883 libpulse libtheora libva libvdpau
         libvorbis libvpx libwebp libxv numactl openexr opus)
makedepends=(git cmake ctags libxml2 nasm perl-xml-libxml
             perl-xml-parser python xorg-mkfontdir
             xorg-mkfontscale yasm)
conflicts=(cin)
source=("cinelerra-gg::git://git.cinelerra-gg.org/goodguy/cinelerra.git#tag=${_pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/cinelerra-gg/cinelerra-5.1"
  ./autogen.sh
}

build() {
  cd "${srcdir}/cinelerra-gg/cinelerra-5.1"
  ./configure \
    --prefix=/usr \
    --disable-static-build \
    --with-exec-name=cinelerra-gg
  make -j1
}

package() {
  cd "${srcdir}/cinelerra-gg/cinelerra-5.1"
  make -j1 DESTDIR="${pkgdir}" install
}
