# Maintainer: Conor Finn <finnconor@gmail.com>
pkgname=buildkite-cli-bin
pkgver=3.67.0
pkgrel=1
pkgdesc="The official Buildkite CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/buildkite/cli"
license=('MIT')
provides=('buildkite-cli' 'bk')
conflicts=('buildkite-cli')

_base_url="https://github.com/buildkite/cli/releases/download/v${pkgver}"

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base_url}/bk_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base_url}/bk_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('d3bbd5501bd28b373cf9fe805f9572dea20cb2212f9f1a6027e57918cc739983')
sha256sums_aarch64=('a6e1cece3cbe687519a9c76c02eb2d1af7ade7f7e65578147bf329aa6c9ab2f8')

package() {
    cd "bk_${pkgver}_linux_$([ "$CARCH" = 'x86_64' ] && echo amd64 || echo arm64)"
    install -Dm755 bk "${pkgdir}/usr/bin/bk"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
