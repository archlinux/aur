# Maintainer: Eugene Gorodinsky <e.gorodinsky@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
libname=libblockdev
pkgname=$libname-lean
pkgver=2.19
pkgrel=1
pkgdesc="Lean version of libblockdev without any of the plugins"
arch=('x86_64')
url="https://github.com/storaged-project/libblockdev"
provides=(libblockdev)
conflicts=(libblockdev)
license=('LGPL')
depends=('parted')
makedepends=('gobject-introspection' 'systemd' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/storaged-project/libblockdev/archive/$pkgver-1.tar.gz")
sha512sums=('945671600036c8d923a2af9a2044535c78d6e887c3a02b0f7ce782cf9deff7f962b7a96fd092cd408aa48717665afa1db7b8d3f7b33e572fd2beb13df98f5c7d')

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
