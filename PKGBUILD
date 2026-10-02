# Maintainer: d-koc <00dkoc00_at_g.m.a.i.l...c.o.m>
# Contributor: envolution
# Contributor: Cody Schafer <dev at codyps.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=fuse-archive
_reponame=mount-archive
pkgver=1.26
pkgrel=1
pkgdesc="FUSE file system for archives and compressed files (ZIP, RAR, 7Z, ISO, TGZ, XZ...)"
arch=(x86_64)
url="https://github.com/fdegros/$_reponame"
license=('Apache-2.0')
depends=(
  fuse3
  glibc
  libarchive
  libgcc
  libstdc++
  libatomic)
makedepends=(boost)
checkdepends=(python)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e0b318ee8adfcd0f1e33ab54e67727b7d20886be5ab6b20d6aea23e656f2a92')

build() {
  cd "$_reponame-$pkgver" || exit
  make
}

check() {
  cd "$_reponame-$pkgver" || exit
  make check-fast
}

package() {
  cd "$_reponame-$pkgver" || exit
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
