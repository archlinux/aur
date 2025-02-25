# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: young.acinonyx <young.acinonyx@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libvpx1.10
pkgver=1.10.0
pkgrel=1
pkgdesc='VP8 and VP9 codec, provides libvpx.so.6'
arch=(x86_64)
url="https://www.webmproject.org/"
license=(BSD)
depends=(gcc-libs)
makedepends=(git nasm)
provides=(libvpx.so)
source=("https://github.com/webmproject/libvpx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('85803ccbdbdd7a3b03d930187cb055f1353596969c1f92ebec2db839fa4f834a')

build() {
  cd "$srcdir/libvpx-${pkgver}"
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
  cd "$srcdir/libvpx-${pkgver}"
  make install DESTDIR="$pkgdir"
  # Remove unneeded files so that only the shared library remains
  rm -rf "$pkgdir/usr"/{bin,include,lib/{libvpx.{a,so},pkgconfig},share}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
