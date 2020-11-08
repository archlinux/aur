# Maintainer: Benjamin Feakins <feakster at poster dot eu>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Andrea Benazzo <andy at qitty dot net>
# Modified PKGBUILD from https://aur.archlinux.org/packages/cryptmount/

pkgname=cryptmount-arm
pkgver=5.3.2
_pkgver=5.3
pkgrel=2
pkgdesc="Utility which allows an ordinary user to mount an encrypted file system"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://cryptmount.sourceforge.net/"
license=('GPL')
provides=(cryptmount)
depends=(cryptsetup device-mapper glibc libgcrypt systemd util-linux)
makedepends=(gcc)
source=($provides-$pkgver.tar.gz::http://downloads.sourceforge.net/project/cryptmount/cryptmount/cryptmount-$_pkgver/cryptmount-$pkgver.tar.gz)
backup=('etc/cryptmount/cmtab')
sha512sums=('972c7fefadb86bb82cdeb96b185f45bec08ac07d39474a4c7e2a473bc2453624ffcc387b6836a02260dcd0d1176a5a743c45bdf3d7e78d2f519f02a48c62a6b8')

prepare() {
  cd "$srcdir/$provides-$pkgver"

  case "$CARCH" in
    x86_64)
      _arch=x86_64-unknown-linux-gnu
      ;;
    arm)
      _arch=arm-unknown-linux-gnu
      ;;
    armv6h)
      _arch=arm-unknown-linux-gnu
      ;;
    armv7h)
      _arch=arm-unknown-linux-gnu
      ;;
    aarch64)
      _arch=arm-unknown-linux-gnu
      ;;
    *)
      _arch=$(./config.guess)
      ;;
  esac
  echo "Build: $_arch"
}

build() {
  cd "$srcdir/$provides-$pkgver"

  ./configure --build=$_arch --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --with-systemd=yes
  make
}

package() {
  cd "$srcdir/$provides-$pkgver"

  make DESTDIR="$pkgdir" install
}
