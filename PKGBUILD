# Maintainer: Conor Finn <finnconor@gmail.com>
pkgname=buildkite-cli-bin
pkgver=3.34.0
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

sha256sums_x86_64=('029ad322edafa50bd7a7ca7b0cc0aa3b4032814c11e06eafd5ca6d88fb89c9f5')
sha256sums_aarch64=('5f8135bbaaeeaa51ebebb50113f210871c051ef6b9c31c8f079b155a82c8b133')

package() {
    cd "bk_${pkgver}_linux_$([ "$CARCH" = 'x86_64' ] && echo amd64 || echo arm64)"
    install -Dm755 bk "${pkgdir}/usr/bin/bk"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
