# Maintainer: JaxTheWolf <roman.lubij@gmail.com>
# Contributor: Anthony Wang <a at exozy dot me>
# Contributor: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Benjamin Maisonnas <ben at wainei dot net>
# Author: Ondrej Čerman

_pkgname=zenpower3
pkgname=zenpower3-dkms-clang
pkgver=0.2.0
pkgrel=7
pkgdesc='Linux kernel driver for reading sensors for AMD Zen family CPUs. Works with Clang compiled kernels'
arch=('x86_64' 'i686')
url='https://github.com/AliEmreSenel/zenpower3'
license=('GPL2')
makedepends=('git')
depends=('dkms')
provides=('zenpower3')
conflicts=('zenpower3')
install=$_pkgname.install
source=("$_pkgname::git+$url.git#commit=41e042935ee9840c0b9dd55d61b6ddd58bc4fde6"
        "$_pkgname.conf")
sha256sums=('f9ed060f68f0f37b8f771e04500c1741b82d6a5c7cf9adeb19a7d9a05f54bfc7'
            '7bff3a5ea2c8b8abf56ce1d79b9724b1aea89e2564d244e09691070113d60f6a')

prepare() {
  sed -e "s/@CFLGS@//" \
      -e "s/@VERSION@/$pkgver/" \
      -i "$srcdir/$_pkgname/dkms.conf"
  sed -i "s/-Wimplicit-fallthrough=3/-Wimplicit-fallthrough/" "$srcdir/$_pkgname/Makefile"
}

package() {
  install -Dm644 "$srcdir/$_pkgname/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -Dm644 "$srcdir/$_pkgname/Makefile" "$pkgdir/usr/src/$_pkgname-$pkgver/Makefile"
  install -Dm644 "$srcdir/$_pkgname/zenpower.c" "$pkgdir/usr/src/$_pkgname-$pkgver/zenpower.c"

  install -Dm644 "$srcdir/$_pkgname.conf" "$pkgdir/usr/lib/modprobe.d/$_pkgname.conf"
}

# vim:set et ts=2 sw=2 tw=79
