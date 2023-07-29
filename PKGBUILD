# Maintainer: bouhaa <boukehaarsma23 at gmail dot com>

_pkgname=zenergy
pkgname=$_pkgname-dkms-git
pkgver=21.09f4d2f
pkgrel=1
pkgdesc='Linux kernel driver for reading RAPL registers for AMD Zen CPUs'
arch=('x86_64' 'i686')
url='https://github.com/boukehaarsma23/zenergy'
license=('GPL2')
depends=('dkms')
provides=('zenergy-dkms')

source=("$_pkgname::git+$url.git")

b2sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e "s/@CFLGS@//" \
      -e "s/@VERSION@/$pkgver/" \
      -i "$srcdir/$_pkgname/dkms.conf"
}

package() {
  install -Dm644 "$srcdir/$_pkgname/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -Dm644 "$srcdir/$_pkgname/Makefile" "$pkgdir/usr/src/$_pkgname-$pkgver/Makefile"
  install -Dm644 "$srcdir/$_pkgname/zenergy.c" "$pkgdir/usr/src/$_pkgname-$pkgver/zenergy.c"
}
