# Maintainer: Conor Finn <finnconor@gmail.com>
pkgname=buildkite-cli-bin
pkgver=3.69.0
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

sha256sums_x86_64=('d435b99657f0ef37cb6493c927bea35af4fec9570143a763ffd7bb4eb8208491')
sha256sums_aarch64=('3f9704c1165cd6e21e579d6c96e55459589cb69d811f399e5f402d2609baa907')

package() {
    cd "bk_${pkgver}_linux_$([ "$CARCH" = 'x86_64' ] && echo amd64 || echo arm64)"
    install -Dm755 bk "${pkgdir}/usr/bin/bk"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
