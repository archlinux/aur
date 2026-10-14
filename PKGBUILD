# Maintainer: JOKER-53 <kadhiravan226@gmail.com>
pkgname=nodewipe
pkgver=0.7.0
pkgrel=1
pkgdesc="Find and reclaim disk space from stray dev artifacts (node_modules, Python venvs, Rust/Java/JS build caches, and more)"
arch=('x86_64')
url="https://github.com/JOKER-53/nodewipe"
license=('MIT')
provides=('nodewipe')
conflicts=('nodewipe-bin')
source=("nodewipe-${pkgver}::https://github.com/JOKER-53/nodewipe/releases/download/v${pkgver}/nodewipe-linux-x86_64")
sha256sums=('SKIP')

package() {
    local bin="${pkgdir}/usr/bin/nodewipe"
    install -Dm755 "${srcdir}/nodewipe-${pkgver}" "$bin"

    # Generate and install manual page
    "$bin" man > "${srcdir}/nodewipe.1" 2>/dev/null || true
    if [ -s "${srcdir}/nodewipe.1" ]; then
        install -Dm644 "${srcdir}/nodewipe.1" "${pkgdir}/usr/share/man/man1/nodewipe.1"
    fi

    # Generate and install shell completions
    "$bin" completions bash > "${srcdir}/nodewipe.bash" 2>/dev/null || true
    [ -s "${srcdir}/nodewipe.bash" ] && install -Dm644 "${srcdir}/nodewipe.bash" "${pkgdir}/usr/share/bash-completion/completions/nodewipe"

    "$bin" completions zsh > "${srcdir}/_nodewipe" 2>/dev/null || true
    [ -s "${srcdir}/_nodewipe" ] && install -Dm644 "${srcdir}/_nodewipe" "${pkgdir}/usr/share/zsh/site-functions/_nodewipe"

    "$bin" completions fish > "${srcdir}/nodewipe.fish" 2>/dev/null || true
    [ -s "${srcdir}/nodewipe.fish" ] && install -Dm644 "${srcdir}/nodewipe.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/nodewipe.fish"
}
