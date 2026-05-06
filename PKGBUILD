# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=kmcp-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='CLI tool and Kubernetes controller for building, testing and deploying MCP servers'
arch=('x86_64' 'aarch64')
url='https://github.com/kagent-dev/kmcp'
license=('Apache-2.0')
provides=('kmcp')
conflicts=('kmcp')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/kmcp-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/kmcp-linux-arm64")
sha256sums_x86_64=('b1d7c3ceccb3ab7aa578e0fe57e7ebf4b523c686b7a3ff0b751fc1d2ecc32829')
sha256sums_aarch64=('6babd191f3af4266b886f76b5245e0ad0a430dc1cb22f77eef11a3ed19421963')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/kmcp"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/kagent-dev/kmcp/blob/main/LICENSE
EOF

    "${pkgdir}/usr/bin/kmcp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kmcp"
    "${pkgdir}/usr/bin/kmcp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kmcp"
    "${pkgdir}/usr/bin/kmcp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/kmcp.fish"
}
