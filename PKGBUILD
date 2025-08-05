# Maintainer: envolution
# Contributor: Cody Schafer <dev at codyps.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=fuse-archive
pkgver=1.14
pkgrel=1
pkgdesc="FUSE file system for archives and compressed files (ZIP, RAR, 7Z, ISO, TGZ, XZ...)"
arch=(x86_64)
url="https://github.com/google/fuse-archive"
license=('Apache-2.0')
depends=(
  fuse3
  glibc
  libarchive
  gcc-libs)
makedepends=(boost)
checkdepends=(python)
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/fuse-archive/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a571b7cdf43748cedfc4adae21390f95b1e48ec05d8760d512cc0c1baba005c9')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  # make -k check #skip due to a couple mtime issues
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
