# Maintainer: everyx <lunt.luo#gmail.com>

pkgbase=sing-geosite
pkgname=(sing-geosite-rule-set sing-geosite-db)
pkgver=20240324094850
pkgrel=3
pkgdesc="Geosite Database and Rule Set for sing-box"
arch=(any)
url="https://github.com/SagerNet/$pkgbase"
license=(MIT GPL-3.0-or-later)

makedepends=(git)

source=("geosite.db::$url/releases/download/$pkgver/geosite.db"
        "LICENSE::https://raw.githubusercontent.com/v2fly/domain-list-community/master/LICENSE")
sha256sums=('56d12105bcdcfecf9a209a34a3c43d54ad4458928e1addec819bcd6995cfd47a'
            'b9d84a22870d3f21c91a4c6e410c9cc51d00902f5233ad0c84011479244bf7d2')

prepare() {
  git clone --depth 1 --branch rule-set $url
}

package_sing-geosite-rule-set() {
  pkgdesc="sing-geosite (rule-set)"
  provides=($pkgbase)

  install -dm755 "$pkgdir/usr/share/sing-box/$pkgname"
  install -Dm644 $pkgbase/*.srs "$pkgdir/usr/share/sing-box/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_sing-geosite-db() {
  pkgdesc="sing-geosite (database)"
  provides=($pkgbase)

  install -dm755 "$pkgdir/usr/share/sing-box"
  install -Dm644 geosite.db "$pkgdir/usr/share/sing-box"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
