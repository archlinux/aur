# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=aura-bin
pkgver=4.0.2
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
)
provides=("aura")
conflicts=("aura" "aura-git" "aura3-bin")
options=("strip")
source=("aura-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/aura-$pkgver-x86_64.tar.gz")
sha256sums=('ee2a515784c317e333defbff23572c52df3683a217c6ba5ef9448d46600d65bc')

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
}
