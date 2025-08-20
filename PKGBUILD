# Maintainer: envolution
# Contributor: Cody Schafer <dev at codyps.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=fuse-archive
pkgver=1.16
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
sha256sums=('e03929f280de7eded6de8817f1aa61f55ae07551bd8c6f30c4112a9b6d154f02')

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
