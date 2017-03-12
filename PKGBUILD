pkgname=parprouted
pkgver=0.7
pkgrel=4
pkgdesc="daemon for transparent IP (Layer 3) proxy ARP bridging"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://freecode.com/projects/parprouted"
license=('GPL2')
depends=('iproute')
source=("http://www.hazard.maks.net/parprouted/parprouted-$pkgver.tar.gz"
        "000-routecmd.diff"
        "parprouted.conf"
        "parprouted.service")
sha256sums=('d63643c95d4149a3d71112da5892f459433456bf0279bfa304625f109178defc'
            '410627dbe8eb4914cc6a9844a96a248738f6a0204353d409a91a5573d1917f23'
            'b1b29e6ad3bbb9697a702050f7cc3f8ccc6af3c0935924ab51fc85685c745baa'
            '2eeeb647b5e47313fffa2dfd80f0df9e30fd70cd6fa8fce043b69eab56e4a5c9')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < ../000-routecmd.diff
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 parprouted   "$pkgdir"/usr/bin/parprouted
  install -Dm0644 parprouted.8 "$pkgdir"/usr/share/man/man8/parprouted.8

  cd "$srcdir"
  install -Dm0644 parprouted.conf    "$pkgdir"/etc/conf.d/parprouted
  install -Dm0644 parprouted.service "$pkgdir"/usr/lib/systemd/system/parprouted.service
}

# vim: ts=2:sw=2:et
