# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=libwebp0.5
pkgver=0.5.2
pkgrel=1
pkgdesc="WebP library and conversion tools"
arch=(x86_64)
url="https://developers.google.com/speed/webp/"
license=(BSD)
depends=(libpng libjpeg-turbo libtiff giflib)
makedepends=(freeglut mesa glu)
optdepends=('freeglut: vwebp viewer')
source=(https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-$pkgver.tar.gz)
sha256sums=('b75310c810b3eda222c77f6d6c26b061240e3d9060095de44b2c1bae291ecdef')

prepare() {
  cd "$srcdir/libwebp-$pkgver"
}

build() {
  cd "$srcdir/libwebp-$pkgver"

  ./configure --prefix=/usr \
     --enable-swap-16bit-csp \
     --enable-experimental \
     --enable-libwebp{mux,decoder} \
     --disable-static
  make
}

package() {
  cd "$srcdir/libwebp-$pkgver"

  make DESTDIR="$pkgdir/" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/{libwebp{mux,decoder,}.{a,so},pkgconfig},share}

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
