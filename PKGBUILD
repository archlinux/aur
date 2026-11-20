# Maintainer: Guru <anjanaya@gmail.com>
pkgname=qodana-cli-bin
pkgver=2026.3.1
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
sha256sums_x86_64=('dae6d31f481ed15c6c016fd746e907978f0c1437010326fa04a92f13c7c52338')
sha256sums_aarch64=('afc4514cc84670809435941579f40002ddc999d716cf84072dd16e7e35b11b95')

package() {
    install -Dm755 "${srcdir}/qodana" "${pkgdir}/usr/bin/qodana"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${srcdir}/qodana" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/qodana"
    "${srcdir}/qodana" completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_qodana"
    "${srcdir}/qodana" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/qodana.fish"
}
