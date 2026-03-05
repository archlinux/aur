# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=kmcp-bin
pkgver=0.2.7
pkgrel=1
pkgdesc='CLI tool and Kubernetes controller for building, testing and deploying MCP servers'
arch=('x86_64' 'aarch64')
url='https://github.com/kagent-dev/kmcp'
license=('Apache-2.0')
provides=('kmcp')
conflicts=('kmcp')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/kmcp-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/kmcp-linux-arm64")
sha256sums_x86_64=('cf6a755c9fe1fd964fafe2599bedb80a76b6bf93fdce7e825dd72e6ab667d2a7')
sha256sums_aarch64=('74c1f66046c42fac525331a3d09f2900b3ea7de1f3d5ee8d4e448bcffc82f66a')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/kmcp"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/kagent-dev/kmcp/blob/main/LICENSE
EOF

    "${pkgdir}/usr/bin/kmcp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kmcp"
    "${pkgdir}/usr/bin/kmcp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kmcp"
    "${pkgdir}/usr/bin/kmcp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/kmcp.fish"
}
