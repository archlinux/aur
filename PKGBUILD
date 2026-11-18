# Maintainer: Guru <anjanaya@gmail.com>
pkgname=qodana-cli-bin
pkgver=2026.2.4
pkgrel=1
pkgdesc="JetBrains Qodana CLI - code quality tool for analyzing projects"
arch=('x86_64' 'aarch64')
url="https://github.com/JetBrains/qodana-cli"
license=('Apache-2.0')
provides=('qodana' 'qodana-cli')
conflicts=('qodana' 'qodana-cli')
options=('!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/JetBrains/qodana-cli/releases/download/v${pkgver}/qodana_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/JetBrains/qodana-cli/releases/download/v${pkgver}/qodana_linux_arm64.tar.gz")
sha256sums_x86_64=('589a9bd92b76fe208f0f39badca471b01dffdda237ba4e80eab5af7040239e17')
sha256sums_aarch64=('758e5aa00db839cfa57f6bf3e8267a53587c5f2a90a01e975121c727b5351182')

package() {
    install -Dm755 "${srcdir}/qodana" "${pkgdir}/usr/bin/qodana"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${srcdir}/qodana" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/qodana"
    "${srcdir}/qodana" completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_qodana"
    "${srcdir}/qodana" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/qodana.fish"
}
