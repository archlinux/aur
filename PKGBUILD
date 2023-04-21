# Contributor: Dennis Hamester <dennis.hamester@startmail.com>

pkgname=scraw
pkgver=0.2.1
pkgrel=2
pkgdesc="Steam Controller C library"
arch=('i686' 'x86_64')
url="https://gitlab.com/dennis-hamester/scraw"
license=('custom:ISC')
depends=(
  'libusb'
)
makedepends=(
  'cmake'
  'doxygen'
)
source=(
  "scraw-v$pkgver.tar.gz::$url/-/archive/v$pkgver/scraw-v$pkgver.tar.gz"
)
sha256sums=(
  '6b0afd0417577aad482a010b3f2754790b1e2cce59d14711dac3a0dd25afc39c'
)

prepare() {
  cd "$srcdir/$pkgname-v$pkgver"

  doxygen -u "doc/Doxyfile.in"
}

build() {
  cmake \
    -B build \
    -S "$pkgname-v$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SCRAW_INFO=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-v$pkgver/LICENSE"
}
