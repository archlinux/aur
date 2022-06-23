# Maintainer: Anthony Wang <ta180m at proton dot me>
# Contributor: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Benjamin Maisonnas <ben at wainei dot net>
# Author: Ondrej Čerman

_pkgname=zenpower3
pkgname=zenpower3-dkms
pkgver=0.2.0
pkgrel=3
pkgdesc='Linux kernel driver for reading sensors for AMD Zen family CPUs'
arch=('x86_64' 'i686')
url='https://git.exozy.me/Ta180m/zenpower3'
license=('GPL2')
depends=('dkms')
provides=('zenpower3')
conflicts=('zenpower3')
install=$_pkgname.install
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$_pkgname.conf")
sha256sums=('6c48f7e07d13658f357a02005da1689cb6935fac34e21a4bf5b7483c7d0c4476'
            '7bff3a5ea2c8b8abf56ce1d79b9724b1aea89e2564d244e09691070113d60f6a')

prepare() {
  sed -e "s/@CFLGS@//" \
      -e "s/@VERSION@/$pkgver/" \
      -i "$srcdir/$_pkgname/dkms.conf"
}

package() {
  install -Dm644 "$srcdir/$_pkgname/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -Dm644 "$srcdir/$_pkgname/Makefile" "$pkgdir/usr/src/$_pkgname-$pkgver/Makefile"
  install -Dm644 "$srcdir/$_pkgname/zenpower.c" "$pkgdir/usr/src/$_pkgname-$pkgver/zenpower.c"

  install -Dm644 "$srcdir/$_pkgname.conf" "$pkgdir/usr/lib/modprobe.d/$_pkgname.conf"
}

# vim:set et ts=2 sw=2 tw=79
