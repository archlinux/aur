# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Anthony Wang <a at exozy dot me>
# Contributor: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Benjamin Maisonnas <ben at wainei dot net>
# Author: Ondrej Čerman

_pkgname=zenpower3
pkgname=zenpower3-dkms
pkgver=0.2.0
pkgrel=9
pkgdesc='Linux kernel driver for reading sensors for AMD Zen family CPUs'
arch=('x86_64' 'i686')
url='https://github.com/AliEmreSenel/zenpower3'
license=('GPL2')
makedepends=('git')
depends=('dkms')
provides=("$_pkgname" "zenpower")
conflicts=("$_pkgname" "zenpower")
install=$_pkgname.install
source=("$_pkgname::git+$url.git#commit=fe7a960afd896629007682fbe0836b97cd8f5a98"
        "$_pkgname.conf")
sha256sums=('0b52ca55185e7a0ba1eb05b9608fbab02b9e41de532df6306ec79d96e5f4b258'
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
