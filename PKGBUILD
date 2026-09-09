# Maintainer: Malte Linke <me@parzival.space>

pkgname=topf
pkgdesc='Talos orchestrator by PostFinance'
pkgdesc='Talos orchestrator by PostFinance'
pkgver=0.6.0 # renovate: datasource=github-tags depName=postfinance/topf versioning=semver
pkgrel=1
arch=('x86_64')
url="https://github.com/postfinance/topf"
license=('MIT')
provides=('topf')
conflicts=('topf')
depends=() # no dependencies, not a dynamic executable
makedepends=(go)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/postfinance/topf/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b3e62f9e2265632c838250f45973788dc60a11a7dd6daa2f01a43e0a37edab3a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -trimpath -ldflags "-X main.version=${pkgver}" -o bin/topf ./cmd/topf
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/topf" "${pkgdir}/usr/bin/topf"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
