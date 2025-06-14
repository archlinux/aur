# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>

pkgname=pnc
pkgver=0.9.5
pkgrel=1
pkgdesc="libphonenumber command-line wrapper continued (by the sxmo project)"
url="https://git.sr.ht/~anjan/pnc"
arch=('x86_64' 'armv7h' 'aarch64')
depends=('libphonenumber.so' 'libicuuc.so' 'gcc-libs' 'glibc')
license=('GPL-3.0-only')
makedepends=('cmake' 'gawk')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~anjan/pnc/archive/$pkgver.tar.gz")
sha256sums=('48fc76cf1c74ed542278be677f527397f4928e835f819869473f6f32a3cea720')

build() {
  cd "$pkgname-$pkgver"

  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver/build"
  ctest
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir/usr/lib"
}
