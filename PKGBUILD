# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Disclaimer: I have no idea if this works, I only packaged it.
pkgname=rasdaemon
pkgver=0.5.8
pkgrel=1
pkgdesc="Logging daemon for Platform Reliability, Availability and Serviceability (RAS), replacing mcelog"
arch=(i686 x86_64)
url="http://www.infradead.org/~mchehab/rasdaemon/"
license=(GPL2)
source=("git://git.infradead.org/users/mchehab/rasdaemon.git"
        rasdaemon.service)
sha256sums=('SKIP'
            'ed26fbace3adb7fc1880bc3c003a1ffe9c732fdc87a5172398cb04355b1c2d8a')
#validpgpkeys=()

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr             \
    --sbindir=/usr/bin        \
    --sysconfdir=/etc         \
    --enable-aer              \
    --enable-mce              \
    --enable-extlog           \
    ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -D -m 644 "$srcdir"/rasdaemon.service \
                    "$pkgdir"/usr/lib/systemd/system/rasdaemon.service
}

# vim: ts=2:sw=2:et:ft=sh
