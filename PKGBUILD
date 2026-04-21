# Maintainer: JasonLandbridge

pkgname=omniroute-bin
pkgver=3.6.9
pkgrel=1
pkgdesc="OpenAI-compatible AI gateway with routing, retries, caching, and observability"
arch=('x86_64')
url="https://github.com/diegosouzapw/OmniRoute"
license=('MIT')
depends=('nodejs')
makedepends=()
optdepends=('systemd: user service management via systemctl --user')
install="${pkgname}.install"
options=('!strip')
source=(
  "${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/omniroute/-/omniroute-${pkgver}.tgz"
  'omniroute.sh'
  'omniroute.service'
  '.env.example'
)
sha512sums=(
  '3b2d6dcbd5b2dfe7639eccb6ebfe5c9152a093606ddf95da85ab818e7df2bb35f781088fcb1ced0bd2dc0c266ff2c8e8ef70c4d19c99b03543dd1eca47370826'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -d "${pkgdir}/usr/lib/omniroute"
  cp -a "${srcdir}/package/." "${pkgdir}/usr/lib/omniroute/"

  install -Dm755 "${srcdir}/omniroute.sh" "${pkgdir}/usr/bin/omniroute"
  install -Dm644 "${srcdir}/omniroute.service" "${pkgdir}/usr/lib/systemd/user/omniroute.service"
  install -Dm644 "${srcdir}/.env.example" "${pkgdir}/usr/share/doc/${pkgname}/.env.example"
  install -Dm644 "${srcdir}/package/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
