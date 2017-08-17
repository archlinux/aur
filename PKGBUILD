# Maintainer: PlusMinus

_libname=evdi
pkgname=$_libname-pre-release
pkgver=1.4.1
pkgrel=9
pkgdesc="A Linux® kernel module that enables management of multiple screens."
arch=('i686' 'x86_64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
groups=()
depends=(dkms)
makedepends=()
optdepends=()
provides=("$_libname=$pkgver")
conflicts=($_libname)
backup=()
options=()
install=$pkgname.install
changelog=$pkgname.Changelog
source=($_libname-$pkgver-$pkgrel.tar.gz::https://github.com/DisplayLink/evdi/archive/v$pkgver.tar.gz)
md5sums=('eece77058251418d5707457aa8ae914e')
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
