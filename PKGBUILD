# Maintainer: bbj <benigno at duck dot com>
pkgname=kmcp-bin
pkgver=0.2.6
pkgrel=1
pkgdesc='CLI tool and Kubernetes controller for building, testing and deploying MCP servers'
arch=('x86_64' 'aarch64')
url='https://github.com/kagent-dev/kmcp'
license=('Apache-2.0')
provides=('kmcp')
conflicts=('kmcp')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/kmcp-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/kmcp-linux-arm64")
sha256sums_x86_64=('1363be33665a8c6c6834841718f3f0a3ce1e2e09c0dee3b2093249d8ab7ef99c')
sha256sums_aarch64=('2d732699d52e448a7cdd37049edfe80f5d4e14e7bf935649f642f8a890b9e7f3')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/kmcp"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/kagent-dev/kmcp/blob/main/LICENSE
EOF

    "${pkgdir}/usr/bin/kmcp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kmcp"
    "${pkgdir}/usr/bin/kmcp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kmcp"
    "${pkgdir}/usr/bin/kmcp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/kmcp.fish"
}
