# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=natpmp
pkgver=0.2.3
pkgrel=1
pkgdesc="NAT-PMP server"
arch=(i686 x86_64)
url="https://savannah.nongnu.org/projects/natpmp/"
license=(GPL2)
depends=(iptables)
source=("https://download.savannah.gnu.org/releases/natpmp/natpmp-$pkgver.tar.gz"
        "natpmp.service")
sha256sums=('ba862f71572a9e6255b495569031c224cfeaf8fce91c5c6005ed25874ffcb42c'
            'e336e1ebceddf355f39d1ae3a89f17413522463106af687b6c321e35451906de')
validpgpkeys=('14BC25105C4441E5BF288F8323A23DD000F4865D') # Adrian Friedli

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 natpmp "$pkgdir/usr/lib/natpmp/natpmp"
  install -D -m 644 natpmp.1 "$pkgdir/usr/share/man/man1/natpmp.1"

  cd "$srcdir"
  install -D -m 644 natpmp.service "$pkgdir/usr/lib/systemd/system/natpmp.service"
}

# vim: ts=2:sw=2:et:ft=sh
