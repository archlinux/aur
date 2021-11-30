# Maintainer: lestb <gitcommitter at email dot ardentcoding dot com>
# Package Repository: https://github.com/mij-aur-packages/log2ram

pkgname=log2ram
pkgver=1.6.0
pkgrel=1
pkgdesc="ramlog like for systemd (Put log into a ram folder)"
arch=('any')
url="https://github.com/azlux/log2ram"
license=('MIT')
backup=('etc/log2ram.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/azlux/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('844d85c503a8b0e34c5cc7627c229cc581acd0d6f36115195ac9a5f9686efe65')

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
