# Maintainer: Mitchell Murphy <mitchell.murphy@defenseunicorns.com>
pkgname=zarf-bin
pkgver=0.71.1
pkgrel=4
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

sha256sums_x86_64=('d271ee1fbb2588c39376f0cdd28a176759597880dd28eaa156af1b1b2223165f')


package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}_Linux_amd64" "${pkgdir}/usr/bin/zarf"
    mkdir -p completions
    "${pkgdir}/usr/bin/zarf" completion zsh > completions/_zarf
    install -D -m 0644 completions/_zarf "${pkgdir}/usr/share/zsh/site-functions/_zarf"
}
