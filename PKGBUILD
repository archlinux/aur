# Maintainer: rownix101 <rownix101@gmail.com>
pkgname=zigmir-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="A blazing-fast Arch Linux mirror speed tester written in Zig"
arch=('x86_64' 'aarch64')
url="https://github.com/rownix101/zigmir"
license=('MIT')
provides=('zigmir')
conflicts=('zigmir')
source_x86_64=("${pkgname}-${pkgver}-${CARCH}::https://github.com/rownix101/zigmir/releases/download/v${pkgver}/zigmir-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-${CARCH}::https://github.com/rownix101/zigmir/releases/download/v${pkgver}/zigmir-linux-arm64")
sha256sums_x86_64=('32404d70bd90b21767d9f317071703df05ba28174e2cf80ec5a73c84312ac0c0')
sha256sums_aarch64=('8f171db52967149d64afcbd49c6f403dacbb615522b6d7da8b76fa2fa3c7163c')
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
