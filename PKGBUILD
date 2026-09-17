# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=kmcp-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='CLI tool and Kubernetes controller for building, testing and deploying MCP servers'
arch=('x86_64' 'aarch64')
url='https://github.com/kagent-dev/kmcp'
license=('Apache-2.0')
provides=('kmcp')
conflicts=('kmcp')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/kmcp-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/kmcp-linux-arm64")
sha256sums_x86_64=('b6cd12bd3ed83d3263fa6417c1015d55c2704fde1e4727b1d1919c701e19a4fc')
sha256sums_aarch64=('df6cc6cfd64a3f9cf1f7ea442b367bcc726f20a08821857a2cea752804f4bdde')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/kmcp"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/kagent-dev/kmcp/blob/main/LICENSE
EOF

    "${pkgdir}/usr/bin/kmcp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kmcp"
    "${pkgdir}/usr/bin/kmcp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kmcp"
    "${pkgdir}/usr/bin/kmcp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/kmcp.fish"
}
