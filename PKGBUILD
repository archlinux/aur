# Maintainer: pencelheimer <pencelheimer@proton.me>
pkgname=lget-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A fast, interactive command-line tool to fetch open-source licenses directly from the SPDX repository."
arch=('x86_64')
url="https://github.com/pencelheimer/lget"
license=('MIT')
provides=('lget')
conflicts=('lget')

source=(
    "lget-${pkgver}::https://github.com/pencelheimer/lget/releases/download/v${pkgver}/lget-linux-x86_64"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/pencelheimer/lget/v${pkgver}/LICENSE"
)

sha256sums=('1b1594e3f82cbcdb34f0f357772d6535e764bb4ef35a1b181a8d395d29be5dac'
            'b05785f9f18e6716bab63424b11454513b9943a222595b70411009202fc592b5')

package() {
    install -Dm755 "${srcdir}/lget-${pkgver}" "${pkgdir}/usr/bin/lget"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # NOTE(pencelheimer): Generate and install shell completions
    local bin="${pkgdir}/usr/bin/lget"

    # Bash
    "$bin" completions bash > lget.bash
    install -Dm644 lget.bash "${pkgdir}/usr/share/bash-completion/completions/lget"

    # Zsh
    "$bin" completions zsh > lget.zsh
    install -Dm644 lget.zsh "${pkgdir}/usr/share/zsh/site-functions/_lget"

    # Fish
    "$bin" completions fish > lget.fish
    install -Dm644 lget.fish "${pkgdir}/usr/share/fish/vendor_completions.d/lget.fish"

    # Elvish
    "$bin" completions elvish > lget.elv
    install -Dm644 lget.elv "${pkgdir}/usr/share/elvish/lib/lget.elv"
}
