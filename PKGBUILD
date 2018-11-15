# Maintainer: rHermes <teodor_spaeren@riseup.net>
# Contributor: PlusMinus

_libname=evdi
pkgname=$_libname-pre-release
pkgver=1.5.1
pkgrel=1
pkgdesc="A Linux® kernel module that enables management of multiple screens."
arch=('i686' 'x86_64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
groups=()
depends=(dkms libdrm)
makedepends=()
optdepends=()
provides=("$_libname=$pkgver")
conflicts=($_libname)
backup=()
options=()
install=$pkgname.install
changelog=$pkgname.Changelog
source=($_libname-$pkgver-$pkgrel.tar.gz::https://github.com/DisplayLink/evdi/archive/v$pkgver.tar.gz)
md5sums=('20a69bf61aef388019afb283bb03ea29')
noextract=()

build() {
# We only need to build the library in this step, dkms will build the module
cd "$_libname-$pkgver/library"

make
}

package() {
# Predfine some target folders
SRCDIR="$pkgdir/usr/src/$_libname-$pkgver"	# This one is needed for dkms
LIBNAME=lib$_libname

cd "$_libname-$pkgver"

install -D -m 755 library/$LIBNAME.so $pkgdir/usr/lib/$LIBNAME.so

install -d $SRCDIR
install -D -m 755 module/* $SRCDIR
}
