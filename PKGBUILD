pkgname=easymosdns-bin
pkgver=3.0
pkgrel=1
pkgdesc="基于Mosdns的精准DNS分流策略，仅需几分钟即可搭建一台支持ECS的无污染DNS服务器。"
arch=('x86_64')
url="https://github.com/pmkol/easymosdns"
license=('GPL3')
provides=('mosdns')

source=(
  "mosdns.zip::https://github.com/IrineSistiana/mosdns/releases/download/v4.5.3/mosdns-linux-amd64.zip"
  "config.zip::https://github.com/pmkol/easymosdns/archive/refs/tags/v3.0.zip"
  "service"
)

sha256sums=('c970f5a5502256d6ef0e3b9729c325f3fca96f1bc09f0573efce9f3ee1cd67a2'
             '7b1062a8e9de0a93555149e042a2f410232e539b73acbaafa20bf89def9e9ec8'
            '5c3954d1ed479fca1dd6b9c948edd0313bd9deaafcc8e57515780bf51defff45')

package() {
  install -Dm755 mosdns "$pkgdir"/usr/bin/mosdns
  install -dm755 "$pkgdir"/etc/mosdns
  cp -R ${srcdir}/easymosdns-3.0/* ${pkgdir}/etc/mosdns
  install -Dm644 service "$pkgdir"/usr/lib/systemd/system/mosdns.service
}
