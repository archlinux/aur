# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=aura-bin
pkgver=4.0.7
pkgrel=1
pkgdesc="A package manager for Arch Linux and its AUR - Prebuild binary"
url="https://github.com/fosskers/aura"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=("git" "curl" "openssl" "gcc-libs" "glibc")
optdepends=(
    "bash-completion: for bash completions"
    "bat: more featureful file viewing"
    "fd: faster filesystem traversal"
    "graphviz: dependency graph generation"
    "ripgrep: faster log searches"
    "shellcheck: PKGBUILD scanning"
    "xdg-utils: for xdg-open"
)
provides=("aura")
conflicts=("aura" "aura-git" "aura3-bin")
options=("strip")
source=("aura-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/aura-$pkgver-x86_64.tar.gz")
sha256sums=('d5dee42a13dfc7c5c2f0df3b6b207c2d09312527f2b9634eba97aad7889efda2')

build() {
    # Build the `info` page.
    makeinfo aura.texi
}

package() {
    # Install binary
    install -Dm755 aura -t "$pkgdir/usr/bin/"

    # Install man and info pages
    install -Dm644 "aura.8" "${pkgdir}/usr/share/man/man8/aura.8"
    install -Dm644 "aura.info" "${pkgdir}/usr/share/info/aura.info"

    # Install bash and zsh completions
    install -Dm644 "bashcompletion.sh" "${pkgdir}/usr/share/bash-completion/completions/aura"
    install -Dm644 "_aura" "${pkgdir}/usr/share/zsh/site-functions/_aura"
    install -Dm644 "aura.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/aura.fish"
}
