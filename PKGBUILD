# Maintainer: Malte Linke <me@parzival.space>

pkgname=topf-bin
pkgdesc='Talos orchestrator by PostFinance'
pkgver=0.6.2 # renovate: datasource=github-tags depName=postfinance/topf versioning=semver
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
sha256sums=('793dc87c97a6545fd73db82c3558306644d9e6914010f2636d1470cf55272405')

package() {
  install -Dm755 "${srcdir}/topf" "${pkgdir}/usr/bin/topf"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
