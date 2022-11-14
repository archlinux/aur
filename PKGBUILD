# Maintainer: suienzan <suienzan at gmail dot com>
_pkgname=mosdns
pkgname=${_pkgname}-bin
pkgver=4.5.3
pkgrel=2
pkgdesc="一个 DNS 转发器"
arch=('x86_64')
url="https://github.com/IrineSistiana/mosdns/"
license=('GPL3')
optdepends=('v2ray-domain-list-community: geosite.dat'
            'v2ray-geoip: geoip.dat'
            'v2ray-rules-dat-git: geosite.dat & geoip.dat')
backup=('etc/mosdns/config.yaml')
provides=('mosdns')

source=(
  "$pkgname-$pkgver.zip::https://github.com/IrineSistiana/mosdns/releases/download/v${pkgver}/mosdns-linux-amd64.zip"
  "config.yaml"
  "service"
  "sysusers"
  "tmpfiles"
)

sha256sums=('c970f5a5502256d6ef0e3b9729c325f3fca96f1bc09f0573efce9f3ee1cd67a2'
            '5ff706ed3d6e5e8624e6f8b276ed1e476be8ebc4747043e63999c8a9f9324ea8'
            '8bb851c5413e0e25e18e9d912a35b1500b54531ea961d4fc6cc8416173311c17'
            '2f2c9bbec87f610d4365cfa2631488a3517d3c5529e7e9942d778f550030c807'
            '0be8eb1cdf1dd563f829c2ab86a00be4d889d22a29e34c9582caff5c2876a2e1')

package() {
  install -Dm755 mosdns "$pkgdir"/usr/bin/mosdns
  install -Dm644 sysusers "$pkgdir/usr/lib/sysusers.d/mosdns.conf"
  install -Dm644 tmpfiles "$pkgdir/usr/lib/tmpfiles.d/mosdns.conf"
  install -Dm644 service "$pkgdir"/usr/lib/systemd/system/mosdns.service
  install -Dm644 config.yaml "$pkgdir"/etc/mosdns/config.yaml
}
