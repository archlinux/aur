# Maintainer: so1ar <so1ar114514@gmail.com>

_pkgname=mosdns
pkgname=${_pkgname}-bin-arm
pkgver=4.5.3
pkgrel=2
pkgdesc="一个 DNS 转发器"
arch=('aarch64' 'armv7h')
url="https://github.com/IrineSistiana/mosdns/"
license=('GPL3')
optdepends=('v2ray-domain-list-community: geosite.dat'
            'v2ray-geoip: geoip.dat'
            'v2ray-rules-dat-git: geosite.dat & geoip.dat')
backup=('etc/mosdns/config.yaml')
provides=('mosdns')

source_aarch64=("${pkgname}-${pkgver}_aarch64.zip::${url}/releases/download/v${pkgver}/mosdns-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}_armv7h.zip::${url}/releases/download/v${pkgver}/mosdns-linux-arm-7.zip")

source=(
  "config.yaml"
  "service"
  "sysusers"
  "tmpfiles"
)

sha256sums=('5ff706ed3d6e5e8624e6f8b276ed1e476be8ebc4747043e63999c8a9f9324ea8'
            '8bb851c5413e0e25e18e9d912a35b1500b54531ea961d4fc6cc8416173311c17'
            '2f2c9bbec87f610d4365cfa2631488a3517d3c5529e7e9942d778f550030c807'
            '0be8eb1cdf1dd563f829c2ab86a00be4d889d22a29e34c9582caff5c2876a2e1')

sha256sums_aarch64=('f8431d5f197537257b1a333df619ea45d587dcc46e36bfac451f4c5eee235dd7')
sha256sums_armv7h=('f51d956ee1fa947e48945a0a4b71aafc0df5653b9e9b3aa43ba0373cffa7ce8e')

package() {
  install -Dm755 mosdns "$pkgdir"/usr/bin/mosdns
  install -Dm644 sysusers "$pkgdir/usr/lib/sysusers.d/mosdns.conf"
  install -Dm644 tmpfiles "$pkgdir/usr/lib/tmpfiles.d/mosdns.conf"
  install -Dm644 service "$pkgdir"/usr/lib/systemd/system/mosdns.service
  install -Dm644 config.yaml "$pkgdir"/etc/mosdns/config.yaml
}
