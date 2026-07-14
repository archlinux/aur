# Maintainer: NirussVn0 <nirusssimple.vn@gmail.com>
pkgname=easy-quest-tui
pkgver=2.0.1
pkgrel=1
pkgdesc='Interactive terminal dashboard for Discord Quest progress'
arch=('any')
url='https://github.com/NirussVn0/easy-quest-tui'
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('21768c9e8435036bb1d00a2296119b7d994e4e25309e31824bb446b01a49fa35')

build() {
  cd "${pkgname}-${pkgver}"
  npm ci
  npm run build
  npm prune --omit=dev
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a dist node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 .env.example "${pkgdir}/usr/share/doc/${pkgname}/.env.example"
  install -Dm644 tokens.txt.example "${pkgdir}/usr/share/doc/${pkgname}/tokens.txt.example"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/dist/easy-quest.js" "${pkgdir}/usr/bin/easy-quest"
}
