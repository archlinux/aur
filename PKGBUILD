# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Co-Maintainer: pingplug < aur at pingplug dot me >
# Contributor: goodguy <lists.cinelerra-gg.org>

pkgname=cinelerra-gg
pkgver=5.1.20200930
pkgrel=1
pkgdesc="Professional video editing and compositing environment"
arch=(x86_64)
url="https://www.cinelerra-gg.org"
license=(GPL2)
depends=(alsa-lib aom dav1d fftw flac glu gtk2 libavc1394
         libdv libiec61883 libpulse libtheora libva libvdpau
         libvorbis libvpx libwebp libxv numactl openexr opus)
makedepends=(cmake ctags libxml2 nasm perl-xml-libxml
             perl-xml-parser python xorg-mkfontdir
             xorg-mkfontscale yasm)
source=("https://www.cinelerra-gg.org/download/pkgs/src/cin_$pkgver-src.tgz")
sha256sums=('b26e55f2fba91a01ff047274a1be970374aca24f869e353a3d80c2e8a56a4e9f')

prepare() {
  cd "${srcdir}/cinelerra-5.1"
  ./autogen.sh
}

build() {
  cd "${srcdir}/cinelerra-5.1"
  ./configure \
    --prefix=/usr \
    --disable-static-build \
    --with-exec-name=cinelerra-gg
  make -j1
}

package() {
  cd "${srcdir}/cinelerra-5.1"
  make -j1 DESTDIR="${pkgdir}" install
}
