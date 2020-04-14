pkgname=dhcp-helper
pkgver=1.2
pkgrel=1
pkgdesc="daemon for DHCP relay agent"
arch=('i686' 'x86_64')
url="http://thekelleys.org.uk/dhcp-helper/"
license=('GPL2')
depends=('iproute')
backup=("etc/conf.d/dhcp-helper")
source=("http://thekelleys.org.uk/dhcp-helper/dhcp-helper-1.2.tar.gz"
        "dhcp-helper.conf"
        "dhcp-helper.service")
sha256sums=('ae9e589ec50f1b5be302e7ebb8111ad734a11e2422a9cf61d08f7858ea2366ad'
            '08a8691c2eb4d249be20f6d93bd2fd987a73d9c91e4be8d73c239a3756788d5f'
            '90edc47cbd1264cb3b8619c3aebab78fd59de40b81550ccf488e404cb9d4f1da')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 dhcp-helper   "$pkgdir"/usr/bin/dhcp-helper
  install -Dm0644 dhcp-helper.8 "$pkgdir"/usr/share/man/man8/dhcp-helper.8

  cd "$srcdir"
  install -Dm0644 dhcp-helper.conf    "$pkgdir"/etc/conf.d/dhcp-helper
  install -Dm0644 dhcp-helper.service "$pkgdir"/usr/lib/systemd/system/dhcp-helper.service
}
