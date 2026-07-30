# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: gsh <gsh.gsh.gsh@protonmail.com>
# Contributor: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-domain-list-custom
pkgver=202607292255
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V (Loyalsoldier's rules)"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-domain-list-community')
conflicts=('v2ray-domain-list-community')

source=("geosite-${pkgver}.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/${pkgver}/geosite.dat")
sha256sums=('9e0b50efeed328ea5b6d827922635bc6cc1f0154484023af579720dbb8fd32d0')

latestver() {
    gh api --paginate repos/Loyalsoldier/v2ray-rules-dat/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "geosite.dat")) | .tag_name' |
    head -1
}

package() {
  install -Dm644 "geosite-${pkgver}.dat" "$pkgdir/usr/share/v2ray/geosite.dat"
}
