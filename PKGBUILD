# Maintainer: Adrian Perez <adrian@perezdecastro.org>
pkgname=9pfuse
pkgver=1
pkgrel=2
pkgdesc="The 9p protocol implementation for FUSE from Plan9 Port"
arch=(x86_64 i686)
url="https://github.com/aperezdc/9pfuse"
license=('GPL')
depends=(fuse)
makedepends=(meson)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('8e7a34e93beaa9eb0f5e018cd5c68d953602445d9f165a2ac4b7f28f3c8a8f0e')

build() {
  rm -rf _build
  arch-meson _build "$pkgname-$pkgver"
  meson compile -C_build

  # Compress man page, the Makefile won't do it
  gzip -9c "$pkgname-$pkgver/9pfuse.4" > 9pfuse.4.gz
}

package() {
  meson install -C_build --destdir "$pkgdir"
  install -m 755 -d "$pkgdir/usr/share/man/man4"
  install -m 644 -t "$pkgdir/usr/share/man/man4" 9pfuse.4.gz
}

# vim:set ts=2 sw=2 et:
