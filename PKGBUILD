# Maintainer: endorfina <emilia@carcosa.space>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: mwawrzyniak <arch at cmstactical dot net>
# Contributor: PlusMinus

pkgname=evdi
pkgver=1.14.1
pkgrel=0
pkgdesc="A Linux® kernel module that enables management of multiple screens."
arch=('i686' 'x86_64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
depends=(glibc dkms libdrm base-devel)
changelog=$pkgname.Changelog
source=(https://github.com/DisplayLink/evdi/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a5f1c10602a6219ac4b13d4f590c16e6fb65bed94f28562260c9b481b48c3828')

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
