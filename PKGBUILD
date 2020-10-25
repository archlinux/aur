# Maintainer: Dana Sorensen <dana.r.sorensen@gmail.com>

pkgname=nft-geo-filter-git
pkgver=v3.0.r39.76e1603
pkgrel=1
pkgdesc="Allow/deny traffic in nftables using country specific IP blocks"
arch=("any")
url="https://github.com/rpthms/nft-geo-filter"
license=("custom") # MIT
depends=("nftables" "python")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/conf.d/nft-geo-filter")
source=("git+$url.git"
        "nft-geo-filter.conf"
        "nft-geo-filter.service"
        "nft-geo-filter.timer")
md5sums=('SKIP'
         'e06e047f9340ea61d0bb95d50d797a8a'
         '02ce6d873f449a01643f932c45c64c0d'
         'dc9fe74b90cf2022213f01a17dc99d88')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 "nft-geo-filter" "$pkgdir/usr/bin/nft-geo-filter"
  install -Dm644 "../nft-geo-filter.service" "$pkgdir/usr/lib/systemd/system/nft-geo-filter.service"
  install -Dm644 "../nft-geo-filter.timer" "$pkgdir/usr/lib/systemd/system/nft-geo-filter.timer"
  install -Dm644 "../nft-geo-filter.conf" "$pkgdir/etc/conf.d/nft-geo-filter"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
