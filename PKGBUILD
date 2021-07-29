# Maintainer: Eugene Gorodinsky <e.gorodinsky@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
libname=libblockdev
pkgname=$libname-lean
pkgver=2.26
pkgrel=1
pkgdesc="Lean version of libblockdev without any of the plugins"
arch=('x86_64')
url="https://github.com/storaged-project/libblockdev"
provides=(libblockdev)
conflicts=(libblockdev)
license=('LGPL')
depends=('parted')
makedepends=('gobject-introspection' 'systemd' 'python' 'autoconf' 'autoconf-archive' 'libbytesize')
source=("$pkgname-$pkgver.tar.gz::https://github.com/storaged-project/libblockdev/archive/$pkgver-1.tar.gz")
sha512sums=('SKIP')

prepare() {
  # sed -i 's/-ldmraid //' $pkgname-$pkgver-1/src/lib/Makefile.am
  :
}

build() {
  cd "$srcdir"/$libname-$pkgver-1
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --without-bcache --without-escrow --without-dmraid --without-btrfs --without-crypto --without-dm --without-loop --without-lvm --without-lvm_dbus --without-mdraid --without-mpath --without-swap --without-kbd --without-nvdimm --without-vdo
  make
}

check() {
  cd "$srcdir"/$libname-$pkgver-1
  make check
}

package() {
  cd "$srcdir"/$libname-$pkgver-1
  make DESTDIR="$pkgdir" install
}
