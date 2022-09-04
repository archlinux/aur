# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jitterentropy-rngd
pkgver=1.2.8
pkgrel=1
pkgdesc="Jitter RNG daemon"
arch=('i686' 'x86_64')
url="https://www.chronox.de/jent.html"
license=('BSD' 'GPL')
depends=('glibc')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/smuellerDD/jitterentropy-rngd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('444a3bd70fef165b6cc56bdd977a0774749431331545ba169a7f242d96d52a79')


prepare() {
  cd "$pkgname-$pkgver"

  sed -i -e 's|sbin|bin|g' "Makefile"
}

build() {
  cd "$pkgname-$pkgver"

  unset CFLAGS
  make
}

package() {
  cd "$pkgname-$pkgver"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/jitterentropy-rngd"
}
