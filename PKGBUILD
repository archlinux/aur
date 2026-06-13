# Maintainer: czyt <czytcn@gmail.com>
pkgname=mise-bin
pkgver=2026.6.5
pkgrel=1
pkgdesc="dev tools, env vars, task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/jdx/mise"
license=('MIT')
optdepends=(
    'bash-completion: bash completion support'
)
provides=('mise')
conflicts=('mise' 'rtx')
replaces=('rtx')
source_x86_64=("https://github.com/jdx/mise/releases/download/v${pkgver}/mise-v${pkgver}-linux-x64-musl.tar.xz")
source_aarch64=("https://github.com/jdx/mise/releases/download/v${pkgver}/mise-v${pkgver}-linux-arm64-musl.tar.xz")
sha256sums_x86_64=('9f6959e549d17c2b811265bd8ed5358eccd9e4e3365d50e8b593cd3efd249fd6')
sha256sums_aarch64=('c7d478505979289ec794c1dfbfc3cb0bcccfedc74eac27778e42362544fa31d1')

package() {
    install -Dm755 "${srcdir}/mise/bin/mise" "${pkgdir}/usr/bin/mise"

    # disable mise self-update (managed by pacman)
    install -Dm644 /dev/null "${pkgdir}/usr/lib/mise/.disable-self-update"

    # man page
    install -Dm644 "${srcdir}/mise/man/man1/mise.1" "${pkgdir}/usr/share/man/man1/mise.1"

    # fish completion (bash/zsh not included in pre-built tarball)
    install -Dm644 "${srcdir}/mise/share/fish/vendor_conf.d/mise-activate.fish" "${pkgdir}/usr/share/fish/vendor_conf.d/mise-activate.fish"

    # license
    install -Dm644 "${srcdir}/mise/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # docs
    install -Dm644 "${srcdir}/mise/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
