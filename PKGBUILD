# Maintainer: Guru <anjanaya@gmail.com>
pkgname=qodana-cli-bin
pkgver=2026.1.3
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
sha256sums_x86_64=('fbe441019cb0696a40669a5e3ba606474696b355befd886c07d515b5b55c6d8d')
sha256sums_aarch64=('e1645353d591cc0d33bafe43fd8cece7a23d8324dda62683272dd68e8843cc49')

package() {
    install -Dm755 "${srcdir}/qodana" "${pkgdir}/usr/bin/qodana"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${srcdir}/qodana" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/qodana"
    "${srcdir}/qodana" completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_qodana"
    "${srcdir}/qodana" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/qodana.fish"
}
