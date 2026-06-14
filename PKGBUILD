# Maintainer: czyt <czytcn@gmail.com>
pkgname=mise-bin
pkgver=2026.6.6
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
sha256sums_x86_64=('34c4298cb72bdf5d2beadb906a59103fbfcccc2be5edd4b4a629352fddf35c3f')
sha256sums_aarch64=('ad243741d66c79cce7a5fad3f872b8cabde3e69797986dec3e4143fa13f7d4e2')

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
