# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=kmcp-bin
pkgver=0.2.8
pkgrel=1
pkgdesc='CLI tool and Kubernetes controller for building, testing and deploying MCP servers'
arch=('x86_64' 'aarch64')
url='https://github.com/kagent-dev/kmcp'
license=('Apache-2.0')
provides=('kmcp')
conflicts=('kmcp')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/kmcp-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/kmcp-linux-arm64")
sha256sums_x86_64=('ff622d90e24d3ebac92437a17961ea12533e2ee54adfca4c4d54c0d328a21d7f')
sha256sums_aarch64=('057759d2c4c45d88e5042c41b3a5bfa84bb62c546f0fe442303baa5d16292db5')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/kmcp"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/kagent-dev/kmcp/blob/main/LICENSE
EOF

    "${pkgdir}/usr/bin/kmcp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kmcp"
    "${pkgdir}/usr/bin/kmcp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kmcp"
    "${pkgdir}/usr/bin/kmcp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/kmcp.fish"
}
