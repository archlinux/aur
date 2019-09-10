# Maintainer: Michael Taboada <michael@2mb.solutions>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>
_pkgname=mokutil
pkgname=mokutil-git
pkgver=0.4.0.r3.g19e8c90
pkgrel=1
pkgdesc="Shim.efi Machine Owner Key management tool git version"
arch=(i686 x86_64)
url="https://github.com/lcp/mokutil"
license=(GPL3)
depends=(efivar openssl)
makedepends=(git)
#_commit=18e5eb052116221197a70e788afc414c1e1f4bb7
source=("git+https://github.com/lcp/mokutil")
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/-/.r/; s/-/./'
}

prepare() {
  cd "$_pkgname"
  autoreconf -f -i
}

build() {
  cd "$_pkgname"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --disable-strict       ;
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
