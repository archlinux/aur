# Maintainer: Zhaofeng Li <hello@zhaofeng.li>

pkgname=gortr-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="An RPKI-to-Router server written in Go"
arch=('x86_64')
url="https://github.com/cloudflare/gortr"
license=('BSD')
depends=()
provides=('gortr')
conflicts=('gortr')
backup=(
  'etc/conf.d/gortr'
)
source=(
  "gortr::https://github.com/cloudflare/gortr/releases/download/v${pkgver}/gortr-v${pkgver}-linux-x86_64"
  "https://github.com/cloudflare/gortr/releases/download/v${pkgver}/cf.pub"
  "https://github.com/cloudflare/gortr/raw/v${pkgver}/LICENSE.txt"
  'gortr.env'
  'gortr.service'
)

md5sums=('f7586dcf627dfe80c09571dc1e495f30'
         'b196196f8598b43023d86821929197e1'
         'b0725559434e18b352046f9b15619960'
         'b8eb3dab8494b7d031249b7d4ae5a5ba'
         '67afd99e5c49c253c8d531d30d1f4f59')

package() {
  install -Dm755 "${srcdir}/gortr" "${pkgdir}/usr/bin/gortr"
  install -Dm644 "${srcdir}/gortr.env" "${pkgdir}/etc/conf.d/gortr"
  install -Dm644 "${srcdir}/gortr.service" "${pkgdir}/usr/lib/systemd/system/gortr.service"
  install -Dm644 "${srcdir}/cf.pub" "${pkgdir}/usr/lib/gortr/cf.pub"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
