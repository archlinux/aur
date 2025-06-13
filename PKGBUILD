# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>

pkgname=pnc
pkgver=0.9.4
pkgrel=10
pkgdesc="libphonenumber command-line wrapper continued (by the sxmo project)"
url="https://git.sr.ht/~anjan/pnc"
arch=('x86_64' 'armv7h' 'aarch64')
depends=('libphonenumber.so' 'libicuuc.so' 'gcc-libs' 'glibc')
license=('GPL-3.0-only')
makedepends=('cmake' 'gawk')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~anjan/pnc/archive/$pkgver.tar.gz"
        "0001-bump-minimum-cmake-version-to-3.10.patch")
sha256sums=('a4852b5b15222c1846cc79d196c639aadf41615fded35fff33606f0639dffa42'
            'c534e103cfa73bd7142867b4e2a7b73f2afb10a2a157f88a71742feb789620fa')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-bump-minimum-cmake-version-to-3.10.patch"
}

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
