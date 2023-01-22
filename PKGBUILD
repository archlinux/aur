# Maintainer: so1ar <so1ar114514@gmail.com>

_pkgname=mosdns
pkgname=${_pkgname}-bin-arm
pkgver=5.0.1
pkgrel=1
pkgdesc="一个 DNS 转发器"
arch=('aarch64' 'armv7h')
url="https://github.com/IrineSistiana/mosdns/"
license=('GPL3')
#optdepends=('v2ray-domain-list-community: geosite.dat'
#            'v2ray-geoip: geoip.dat'
#            'v2ray-rules-dat-git: geosite.dat & geoip.dat'
#            'redis: redis support in cache plugin')
backup=('etc/mosdns/config.yaml')
provides=('mosdns')

source_aarch64=("${pkgname}-${pkgver}_aarch64.zip::${url}/releases/download/v${pkgver}/mosdns-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}_armv7h.zip::${url}/releases/download/v${pkgver}/mosdns-linux-arm-7.zip")

source=(
  "service"
  "sysusers"
  "tmpfiles"
)

sha256sums=('8bb851c5413e0e25e18e9d912a35b1500b54531ea961d4fc6cc8416173311c17'
            'e6bc5034452123491e3901e2741183d528a29b00f1c01d6bbbb204549fee7306'
            '0be8eb1cdf1dd563f829c2ab86a00be4d889d22a29e34c9582caff5c2876a2e1')

sha256sums_aarch64=('c3f4c7ec16c83578a1f73757f57597e99799701aa9c470228f610b2b6f8c20bd')
sha256sums_armv7h=('d84a5a77af4deef49d507234b451b8cfc0fa00c1e9f718a8d35d5e7c0191be38')

package() {
  install -Dm755 mosdns "$pkgdir"/usr/bin/mosdns
  install -Dm644 sysusers "$pkgdir/usr/lib/sysusers.d/mosdns.conf"
  install -Dm644 tmpfiles "$pkgdir/usr/lib/tmpfiles.d/mosdns.conf"
  install -Dm644 service "$pkgdir"/usr/lib/systemd/system/mosdns.service
  install -Dm644 config.yaml "$pkgdir"/etc/mosdns/config.yaml
}
