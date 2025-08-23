# Maintainer: Mitchell Murphy <mitchell.murphy@defenseunicorns.com>
pkgname=zarf-bin
pkgver=0.60.0
pkgrel=3
pkgdesc="Airgap CLI tool for Kubernetes"
arch=(
    'x86_64'
)
url="https://github.com/zarf-dev/zarf"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
optdepends=()

source_x86_64=("${pkgname%-bin}_v${pkgver}_Linux_amd64::${url}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}_Linux_amd64")
# See the release-keys repository
# https://github.com/containers/release-keys
validpgpkeys=(
  EE898AFE83AF6C763093E1CA5E8C9301F384CC5E  # Mitchell Murphy <mitchell.murphy@defenseunicorns.com>
)

sha512sums_x86_64=('53dbf9a42028c59e71c0d1125b42b6e25eccc7b8c39c551b95af52651dfcc9df5265a1c324544f4b82b0cb42c1abeb98469b40316af7382676215679f44d24ad')


package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}_Linux_amd64" "${pkgdir}/usr/bin/zarf"
    mkdir -p completions
    "${pkgdir}/usr/bin/zarf" completion zsh > completions/_zarf
    install -D -m 0644 completions/_zarf "${pkgdir}/usr/share/zsh/site-functions/_zarf"
}
