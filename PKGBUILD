# Maintainer: Benjamin Feakins <feakster at poster dot eu>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Andrea Benazzo <andy at qitty dot net>
# Modified PKGBUILD from https://aur.archlinux.org/packages/cryptmount/

pkgname=cryptmount-arm
pkgver=5.3.2
_pkgver=5.3
pkgrel=1
pkgdesc="Utility which allows an ordinary user to mount an encrypted file system"
arch=('armv6h' 'armv7h' 'aarch64')
url="http://cryptmount.sourceforge.net/"
license=('GPL')
provides=(cryptmount)
depends=(libgcrypt device-mapper util-linux)
source=($provides-$pkgver.tar.gz::http://downloads.sourceforge.net/project/cryptmount/cryptmount/cryptmount-$_pkgver/cryptmount-$pkgver.tar.gz)
backup=('etc/cryptmount/cmtab')
sha512sums=('972c7fefadb86bb82cdeb96b185f45bec08ac07d39474a4c7e2a473bc2453624ffcc387b6836a02260dcd0d1176a5a743c45bdf3d7e78d2f519f02a48c62a6b8')

build() {
  cd "$srcdir/$provides-$pkgver"

  ./configure --build=arm --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$provides-$pkgver"

  make DESTDIR="$pkgdir" install
}
