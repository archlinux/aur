# Maintainer: Artem Shustrov <shustrov_a@inbox.ru>
pkgname=evo-cli-bin
pkgver=1.8.2
pkgrel=1
pkgdesc='CLI and MCP server for Cloud.ru Evolution'
arch=('x86_64' 'aarch64')
url='https://github.com/shatim-ops/evo-cli'
license=('Apache-2.0')
provides=('evo-cli' 'cloudru-vm')
conflicts=('evo-cli' 'cloudru-vm')
optdepends=('kubectl: Kubernetes commands' 'helm: Helm commands')

source_x86_64=("${url}/releases/download/v${pkgver}/evo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/evo_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fe0d6cdd0cef55ed93b000f3c948967dcf7cb863f4c199a0c61a1741ebc43a84')
sha256sums_aarch64=('0d96c26927ecf0490aa567ba6d1fb7a62c65bd9eb86f53aeb39d512b240fdc01')

package() {
    install -Dm755 "${srcdir}/evo" "${pkgdir}/usr/bin/evo"
    install -Dm755 "${srcdir}/cloudru-vm" "${pkgdir}/usr/bin/cloudru-vm"

    install -d "${pkgdir}/usr/share/bash-completion/completions"
    "${srcdir}/evo" completion bash > "${pkgdir}/usr/share/bash-completion/completions/evo"
    chmod 644 "${pkgdir}/usr/share/bash-completion/completions/evo"

    install -d "${pkgdir}/usr/share/zsh/site-functions"
    "${srcdir}/evo" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_evo"
    chmod 644 "${pkgdir}/usr/share/zsh/site-functions/_evo"

    install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${srcdir}/evo" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/evo.fish"
    chmod 644 "${pkgdir}/usr/share/fish/vendor_completions.d/evo.fish"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -d "${pkgdir}/usr/share/doc/${pkgname}/docs"
    install -m644 "${srcdir}"/docs/*.md "${pkgdir}/usr/share/doc/${pkgname}/docs/"
}
