# Maintainer: n17ikh <n17ikh@gmail.com>
pkgname=coolkey
pkgver=1.1.0_36
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
rpmname=("$pkgname-${pkgver//_/-}.fc28.src.rpm")
source=("https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/28/Everything/source/tree/Packages/c/$rpmname")
sha512sums=('3e9e546451b369a0f858846addeb26ccc263375a4c33dee683ec8a4f17fbdb2a32ca23b44a1009620125d9ec0b84020947c6b290d968806a81a999fa8acda166')

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
