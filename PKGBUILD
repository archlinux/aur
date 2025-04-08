# Maintainer: Storm Dragon <storm_dragon@stormux.org>
# Contributer: lestb <gitcommitter at email dot ardentcoding dot com>

pkgname=log2ram
pkgver=1.7.2
pkgrel=1
pkgdesc="ramlog like for systemd (Put log into a ram folder)"
arch=('any')
url="https://github.com/azlux/log2ram"
license=('MIT')
backup=('etc/log2ram.conf')
optdepends=('rsync: for better performance')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/azlux/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d8094f4c1e11e8efa2403128b4c47fa4cc2bf820c5222ee21c4eecf63471e5ad')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's:/usr/local/bin:/usr/bin:' log2ram.service
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/lib/systemd/system
  install -d "$pkgdir"/etc
  install -m 644 log2ram.service "$pkgdir"/usr/lib/systemd/system/log2ram.service
  install -m 644 log2ram-daily.service "$pkgdir"/usr/lib/systemd/system/log2ram-daily.service
  install -m 644 log2ram-daily.timer "$pkgdir"/usr/lib/systemd/system/log2ram-daily.timer
  install -m 755 log2ram "$pkgdir"/usr/bin/log2ram
  install -m 644 log2ram.conf "$pkgdir"/etc/log2ram.conf

}
