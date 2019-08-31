# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=mokutil
pkgver=0.4.0
pkgrel=1
pkgdesc="Shim.efi Machine Owner Key management tool"
arch=(i686 x86_64)
url="https://github.com/lcp/mokutil"
license=(GPL3)
depends=(efivar openssl)
makedepends=(git)
_commit=18e5eb052116221197a70e788afc414c1e1f4bb7
source=("git+https://github.com/lcp/mokutil#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/.r/; s/-/./'
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
