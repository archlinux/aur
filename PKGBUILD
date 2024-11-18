# Maintainer: Sid Pranjale <mail@sidonthe.net>
_pkgname=zenstats
pkgname=zenstats-dkms
pkgver=0.1.0
pkgrel=1
pkgdesc='Linux kernel driver for reading sensors for AMD Zen and Ryzen family CPUs'
arch=('x86_64' 'i686')
url='https://github.com/Sid127/zenstats'
license=('GPL2')
depends=('dkms')
provides=('zenpower3')
conflicts=('zenpower3')
install=$_pkgname.install
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$_pkgname.conf")
sha256sums=('20477fe7a63b8e7950ed0f2cd2455732e1bb45a5a67e34d882b3593a78b96d91'
            '7bff3a5ea2c8b8abf56ce1d79b9724b1aea89e2564d244e09691070113d60f6a')

prepare() {
  sed -e "s/@CFLGS@//" \
      -e "s/@VERSION@/$pkgver/" \
      -i "$srcdir/$_pkgname-$pkgver/dkms.conf"
}

package() {
  install -Dm644 "$srcdir/$_pkgname-$pkgver/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/Makefile" "$pkgdir/usr/src/$_pkgname-$pkgver/Makefile"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/zenstats.c" "$pkgdir/usr/src/$_pkgname-$pkgver/zenstats.c"

  install -Dm644 "$srcdir/$_pkgname.conf" "$pkgdir/usr/lib/modprobe.d/$_pkgname.conf"
}
