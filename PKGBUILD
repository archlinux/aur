# Maintainer: n17ikh <n17ikh@gmail.com>
pkgname=coolkey
pkgver=1.1.0_32
pkgrel=1
pkgdesc="Provides PKCS11 module support for smart-card readers, now with 144k smartcard/CAC support and downstream Fedora patches."
arch=('i686' 'x86_64')
url="http://directory.fedora.redhat.com/wiki/CoolKey"
license=('GPL')
depends=('pcsclite' 'ccid')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
rpmname=("$pkgname-${pkgver//_/-}.fc26.src.rpm")
source=("https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/c/$rpmname")
sha512sums=('bfbe401700099fed61add4cc6a93328685e9a17b234bba1276bbe1d304ac15ed9ae371f5c9979f4e7e83ee7418e5952da9ff7d33ad2a7944e96f5eeda5f9de68')

build() {
  cd $srcdir
  tar xf coolkey-1.1.0.tar.gz
  cd "$srcdir/coolkey-1.1.0"
  patch -p0 < $srcdir/coolkey-cache-dir-move.patch
  patch -p0 < $srcdir/coolkey-gcc43.patch
  patch -p0 < $srcdir/coolkey-latest.patch
  patch -p0 < $srcdir/coolkey-simple-bugs.patch
  patch -p0 < $srcdir/coolkey-thread-fix.patch
  patch -p0 < $srcdir/coolkey-cac.patch
  patch -p0 < $srcdir/coolkey-cac-1.patch
  patch -p0 < $srcdir/coolkey-pcsc-lite-fix.patch
  patch -p1 < $srcdir/coolkey-fix-token-removal-failure.patch
  patch -p1 < $srcdir/coolkey-update.patch
  patch -p1 < $srcdir/coolkey-more-keys.patch
 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/coolkey-1.1.0"
  make -j1 DESTDIR="$pkgdir/" install
}
