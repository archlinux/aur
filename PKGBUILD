# Maintainer: Mitchell Murphy <mitchell.murphy@defenseunicorns.com>
pkgname=zarf-bin
pkgver=0.61.0
pkgrel=1
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

sha512sums_x86_64=('08d1f9a5114ffcccf3e44e6f2e727964cd6c61e674d35d490b2859e3c8bf7025bf78af97bd50be171cb5e5844d2fc940d18b89de6c8a3be1305ffdd8834ccb6c')


package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}_Linux_amd64" "${pkgdir}/usr/bin/zarf"
    mkdir -p completions
    "${pkgdir}/usr/bin/zarf" completion zsh > completions/_zarf
    install -D -m 0644 completions/_zarf "${pkgdir}/usr/share/zsh/site-functions/_zarf"
}
