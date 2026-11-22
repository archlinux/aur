# Maintainer: Artem Shustrov <shustrov_a@inbox.ru>
pkgname=evo-cli-bin
pkgver=1.9.0
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
sha256sums_x86_64=('52746b3b1417e6aeafa1500cde5da6bcc705654d8acc549ae1a894bcc3d0d901')
sha256sums_aarch64=('f02e95ea59727de3108a72522264fde58384f475e6874523eb7434c7b6759321')

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
