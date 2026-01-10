# Maintainer: rownix101 <rownix101@gmail.com>
pkgname=zigmir-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="A blazing-fast Arch Linux mirror speed tester written in Zig"
arch=('x86_64' 'aarch64')
url="https://github.com/rownix101/zigmir"
license=('MIT')
provides=('zigmir')
conflicts=('zigmir')
source_x86_64=("${pkgname}-${pkgver}-${CARCH}::https://github.com/rownix101/zigmir/releases/download/v${pkgver}/zigmir-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-${CARCH}::https://github.com/rownix101/zigmir/releases/download/v${pkgver}/zigmir-linux-arm64")
sha256sums_x86_64=('481c072d589b11344cd814986c8201644bac3e6fd7d4a737417792d7a1794933')
sha256sums_aarch64=('3f658f29a9430b52abb24aa302ee37d0afa80f3926fc95a4d319eb7fb3e60f35')
package() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}-${CARCH}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zigmir"
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${srcdir}/${pkgname}-${pkgver}-${CARCH}" --completion bash > "${pkgdir}/usr/share/bash-completion/completions/zigmir"
    "${srcdir}/${pkgname}-${pkgver}-${CARCH}" --completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_zigmir"
    "${srcdir}/${pkgname}-${pkgver}-${CARCH}" --completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/zigmir.fish"
}
