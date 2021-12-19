# Maintainer: Anthony Wang <ta180m at protonmail dot com>
# Contributor: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Benjamin Maisonnas <ben at wainei dot net>
# Author: Ondrej Čerman

_pkgname=zenpower3
pkgname=zenpower3-dkms
pkgver=0.2.0
pkgrel=1
pkgdesc='Linux kernel driver for reading sensors for AMD Zen family CPUs'
arch=('x86_64' 'i686')
url='https://github.com/Ta180m/zenpower3'
license=('GPL2')
depends=('dkms')
provides=('zenpower3')
conflicts=('zenpower3')
install=$_pkgname.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Ta180m/$_pkgname/archive/v$pkgver.tar.gz"
        "$_pkgname.conf")
sha256sums=('b206c1dfd8ea742a802126d012404d31ae62f2a23ae4723ea1c0f9f54581f6a3'
            '7bff3a5ea2c8b8abf56ce1d79b9724b1aea89e2564d244e09691070113d60f6a')

prepare() {
  sed -e "s/@CFLGS@//" \
      -e "s/@VERSION@/$pkgver/" \
      -i "$srcdir/$_pkgname-$pkgver/dkms.conf"
}

package() {
  install -Dm644 "$srcdir/$_pkgname-$pkgver/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/Makefile" "$pkgdir/usr/src/$_pkgname-$pkgver/Makefile"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/zenpower.c" "$pkgdir/usr/src/$_pkgname-$pkgver/zenpower.c"

  install -Dm644 "$srcdir/$_pkgname.conf" "$pkgdir/usr/lib/modprobe.d/$_pkgname.conf"
}

# vim:set et ts=2 sw=2 tw=79
