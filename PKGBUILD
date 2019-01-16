# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=mokutil
pkgver=0.3.0.r25.gfb6250f
pkgrel=1
pkgdesc="Shim.efi Machine Owner Key management tool"
arch=(i686 x86_64)
url="https://github.com/lcp/mokutil"
license=(GPL3)
depends=(efivar openssl)
makedepends=(git)
_commit=fb6250f23a1dda24000522f1994f70c73407c402
source=("git+https://github.com/lcp/mokutil#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  git describe | sed 's/-/.r/; s/-/./'
}

prepare() {
  cd "$pkgname"
  autoreconf -f -i
}

build() {
  cd "$pkgname"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       ;
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
