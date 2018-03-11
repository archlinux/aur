# Maintainer: n17ikh <n17ikh@gmail.com>
pkgname=coolkey
pkgver=1.1.0_35
pkgrel=2
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
rpmname=("$pkgname-${pkgver//_/-}.fc27.src.rpm")
source=("https://dl.fedoraproject.org/pub/fedora/linux/releases/27/Everything/source/tree/Packages/c/$rpmname")
sha512sums=('f66c677cceb6adcc59447d53d5dd3fdf89bafd08bf853cdba75fa15cccd268bee4b42aff3a96ccccf88e83182f675a9db2e3ea5fc520f336fc15cc22326f5211')

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
  patch -p0 < $srcdir/coolkey-1.1.0-max-cpu-bug.patch
 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/coolkey-1.1.0"
  make -j1 DESTDIR="$pkgdir/" install
}
