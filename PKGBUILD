# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: mwawrzyniak <arch at cmstactical dot net>
# Contributor: PlusMinus

pkgname=evdi
pkgver=1.11.0
pkgrel=2
pkgdesc="A Linux® kernel module that enables management of multiple screens."
arch=('i686' 'x86_64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
depends=(glibc dkms libdrm)
changelog=$pkgname.Changelog
source=(https://github.com/DisplayLink/evdi/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('ef0ac42566e88d331ee3702cd10901f7f91931c892b2153e7757427c65bd7f7f')

build() {
  # We only need to build the library in this step, dkms will build the module
  cd "$pkgname-$pkgver/library"
  make
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 library/lib$pkgname.so "$pkgdir/usr/lib/lib$pkgname.so"

  SRCDIR="$pkgdir/usr/src/$pkgname-$pkgver"	# This one is needed for dkms
  install -d "$SRCDIR"
  install -Dm0755 module/* "$SRCDIR"
}
