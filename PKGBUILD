# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal-bin
_pkgname=${pkgname%-bin}
pkgver=0.7.1
pkgrel=1
pkgdesc="Command line trash bin"
arch=('x86_64' 'aarch64')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('fzf')
optdepends=('skim: supports skim as finder')
source_x86_64=("${pkgname}-x86_64-${pkgver}.zip::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-musl.zip")
source_aarch64=("${pkgname}-aarch64-${pkgver}.zip::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-musl.zip")
sha256sums_x86_64=('81836ffa7fa7df0f1b0e89eaefe470e318454d10d7c5abcdd30496c88e67ea27')
sha256sums_aarch64=('953c327c29198914750e26d555cd6c193878168b2e6a3ab0e7e81b2eac42def7')
options=(!strip !lto !debug)

package() {
    cd "${_pkgname}-${CARCH}-unknown-linux-musl"

    install -Dm 755 conceal -t "${pkgdir}/usr/bin"
    install -Dm 644 completions/_conceal -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 completions/conceal.bash "${pkgdir}/usr/share/bash-completion/completions/conceal"
    install -Dm 644 completions/conceal.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -Dm 644 completions/conceal.nu -t "${pkgdir}/usr/share/nushell/vendor/autoload"

    install -Dm 755 cnc -t "${pkgdir}/usr/bin"

    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
