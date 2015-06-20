# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=chinadns-c
pkgver=1.3.1
pkgrel=1
pkgdesc="Protect yourself against DNS poisoning in China."
url="https://github.com/clowwindy/ChinaDNS"
arch=("i686" "x86_64")
license=("GPL3")
provides=()
conflicts=()
depends=("glibc")
source=("git+https://github.com/clowwindy/ChinaDNS.git#tag=$pkgver"
        "chinadns.service"
        "chinadns@.service")
md5sums=('SKIP'
         '5eb3e4862773c5bfcb30e21bc080358e'
         '7d810346fca20c9d3c0bb0bfbb7ec360')

build() {
  cd "ChinaDNS"
  ./autogen.sh
  ./configure --datarootdir=/etc --prefix=/usr
  make \
    CFLAGS="$CPPFLAGS $CFLAGS" \
    LDFLAGS="$LDFLAGS"
}

package() {
  cd "ChinaDNS"
  make DESTDIR="$pkgdir" install

  # install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "$srcdir/chinadns.service" "$pkgdir/usr/lib/systemd/system/chinadns.service"
  install -Dm644 "$srcdir/chinadns@.service" "$pkgdir/usr/lib/systemd/system/chinadns@.service"
}

# vim: ts=2 sw=2 et ft=sh
