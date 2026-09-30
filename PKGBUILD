# Maintainer: Malte Linke <me@parzival.space>

pkgname=topf-bin
pkgdesc='Talos orchestrator by PostFinance'
pkgver=0.6.1 # renovate: datasource=github-tags depName=postfinance/topf versioning=semver
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/postfinance/topf"
license=('MIT')
provides=('topf')
conflicts=('topf')
options=('!strip')
depends=() # no dependencies, not a dynamic executable
makedepends=()

# map arch file name
case "${CARCH}" in
  'x86_64')
    _arch="amd64";;
  'aarch64')
    _arch="arm64";;
  *)
    # unsupported arch
    _arch="${ARCH}";;
esac

source=("topf_linux_${_arch}-${pkgver}.tar.gz::https://github.com/postfinance/topf/releases/download/v${pkgver}/topf_linux_${_arch}.tar.gz")
sha256sums=('6f399e527cb8588b02d7d28eae9a61c49680f4cd5e82d98be7a5c5001c80d341')

package() {
  install -Dm755 "${srcdir}/topf" "${pkgdir}/usr/bin/topf"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
