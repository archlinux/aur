# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libvpx1.10
pkgver=1.10.0
pkgrel=1
pkgdesc='VP8 and VP9 codec, provides libvpx.so.6'
arch=(x86_64)
url=https://www.webmproject.org/
license=(BSD)
depends=(gcc-libs)
makedepends=(
  git
  nasm
)
provides=(libvpx.so)
_tag=b41ffb53f1000ab2227c1736d8c1355aa5081c40
source=(https://chromium.googlesource.com/webm/libvpx/+archive/${_tag}.tar.gz)
sha256sums=('f442db9f3cae317fac61d1b980e9efad319aba7afb569ba2469b81f9789cf494')

build() {
  ./configure \
    --prefix=/usr \
    --disable-install-docs \
    --disable-install-srcs \
    --enable-pic \
    --enable-postproc \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --enable-vp8 \
    --enable-vp9 \
    --enable-vp9-highbitdepth \
    --enable-vp9-temporal-denoising \
    --disable-unit-tests
  make
}

package() {
  make DIST_DIR="${pkgdir}"/usr install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/{libvpx.{a,so},pkgconfig},share}

  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
