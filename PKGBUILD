# Maintainer: d-koc <00dkoc00_at_g.m.a.i.l...c.o.m>
# Contributor: envolution
# Contributor: Cody Schafer <dev at codyps.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=fuse-archive
pkgver=1.24
pkgrel=1
pkgdesc="FUSE file system for archives and compressed files (ZIP, RAR, 7Z, ISO, TGZ, XZ...)"
arch=(x86_64)
url="https://github.com/google/fuse-archive"
license=('Apache-2.0')
depends=(
  fuse3
  glibc
  libarchive
  libgcc
  libstdc++)
makedepends=(boost)
checkdepends=(python)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2c4bd35b43391a7e736faf44e0e7a7090eab61c16fcf69f63997a454a8700a2b')

build() {
  cd "$pkgname-$pkgver" || exit
  make
}

check() {
  cd "$pkgname-$pkgver" || exit
  # This seems to work now, but causes package to take more than 26x
  # longer to build on my machine
  #make check
  # Only takes about 2.5x longer, a better compromise
  make check-fast
}

package() {
  cd "$pkgname-$pkgver" || exit
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
