# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-libvpx
pkgver=1.8.1
pkgrel=1
pkgdesc='VP8 and VP9 codec'
arch=(x86_64)
url=http://www.webmproject.org/
license=(BSD)
depends=(
  lib32-gcc-libs
  libvpx
)
makedepends=(
  git
  nasm
)
provides=(libvpx.so)
source=(git+https://chromium.googlesource.com/webm/libvpx#tag=v${pkgver})
sha256sums=(SKIP)

build() {
  cd libvpx

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --target=x86-linux-gcc \
    --disable-install-bins \
    --disable-install-docs \
    --disable-install-srcs \
    --enable-pic \
    --enable-postproc \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --enable-vp8 \
    --enable-vp9 \
    --enable-vp9-highbitdepth \
    --enable-vp9-temporal-denoising
  make
}

package() {
  cd libvpx

  make DIST_DIR="${pkgdir}/usr" install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libvpx "${pkgdir}"/usr/share/licenses/lib32-libvpx
}

# vim: ts=2 sw=2 et:
