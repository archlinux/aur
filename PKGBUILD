# Maintainer: n17ikh <n17ikh@gmail.com>
pkgname=coolkey
pkgver=1.1.0_27
pkgrel=1
pkgdesc="Provides PKCS11 module support for smart-card readers, now with 144k smartcard/CAC support and downstream Fedora patches."
arch=('i686' 'x86_64')
url="http://directory.fedora.redhat.com/wiki/CoolKey"
license=('GPL')
depends=('pcsclite' 'ccid')
makedepends=(rpmextract)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://mirrors.kernel.org/fedora/development/rawhide/source/SRPMS/c/coolkey-1.1.0-27.fc23.src.rpm')
noextract=(coolkey-1.1.0-27.fc23.src.rpm)
sha512sums=('08c7c6756e31e4f39326a425b3c82279bc79bbc8022aa50151baf8ec0664ec58859c0bd42a56e367380f62fb50f811f320af291280c779b7f13d95eca6bf3cb1')

build() {
  cd $srcdir
  rpmextract.sh coolkey-1.1.0-27.fc23.src.rpm
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
 ./configure --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir/coolkey-1.1.0"
  make DESTDIR="$pkgdir/" install
}
