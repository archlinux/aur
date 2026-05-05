# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jitterentropy-rngd
pkgver=1.3.1
pkgrel=1
pkgdesc="Jitter RNG daemon"
arch=('i686' 'x86_64')
url="https://www.chronox.de/jent.html"
license=('BSD-3-Clause' 'GPL-2.0-or-later')
depends=('glibc')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/smuellerDD/jitterentropy-rngd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('affd90b1d5896d0b3329d5c5274262f9389a89e5b90f43d9b906db638345f79d')


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
