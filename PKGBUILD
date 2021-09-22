# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jitterentropy-rngd
pkgver=1.2.5
pkgrel=1
pkgdesc="Jitter RNG daemon"
arch=('i686' 'x86_64')
url="https://www.chronox.de/jent.html"
license=('BSD' 'GPL')
depends=('glibc')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/smuellerDD/jitterentropy-rngd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('18797fb5eb3dbe18e65c7e864cbfe421b7f9742a9940bc958192ab4e3a6bfa38')


prepare() {
  cd "$pkgname-$pkgver"

  sed -i -e 's|sbin|bin|g' "Makefile"
}

build() {
  cd "$pkgname-$pkgver"

  make CFLAGS=""
}

package() {
  cd "$pkgname-$pkgver"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/jitterentropy-rngd"
}
