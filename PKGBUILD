# Maintainer: Malte Linke <me@parzival.space>

pkgname=topf
pkgdesc='Talos orchestrator by PostFinance'
pkgdesc='Talos orchestrator by PostFinance'
pkgver=0.6.1 # renovate: datasource=github-tags depName=postfinance/topf versioning=semver
pkgrel=1
arch=('x86_64')
url="https://github.com/postfinance/topf"
license=('MIT')
provides=('topf')
conflicts=('topf')
depends=() # no dependencies, not a dynamic executable
makedepends=(go)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/postfinance/topf/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('42493b4fef94fdd6fd6062ae2b1c78a19404ad4a5f7f48e6d6c1d40d26d03695')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -trimpath -ldflags "-X main.version=${pkgver}" -o bin/topf ./cmd/topf
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/topf" "${pkgdir}/usr/bin/topf"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
