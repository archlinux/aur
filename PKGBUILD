# Maintainer: chiconcota <chiconcota@users.noreply.github.com>

pkgname=terminal-image-paste-git
_pkgname=terminal-image-paste
pkgver=1.0.0.r5.gfe4d8c4
pkgrel=1
pkgdesc="Universal CLI utility to quickly paste images from clipboard into terminal on Linux (Wayland / X11)"
arch=('any')
url="https://github.com/chiconcota/terminal-image-paste"
license=('MIT')
depends=('bash')
optdepends=(
    'wl-clipboard: Wayland clipboard support (recommended)'
    'wtype: Wayland keystroke simulation (recommended)'
    'xclip: X11 clipboard support'
    'xdotool: X11 keystroke simulation'
    'timg: High-resolution terminal image viewer'
    'chafa: Character art terminal image viewer fallback'
)
provides=('terminal-image-paste' 'tip')
conflicts=('terminal-image-paste')
source=("git+https://github.com/chiconcota/terminal-image-paste.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"

    # Install CLI binary
    install -Dm755 bin/tip "${pkgdir}/usr/bin/tip"

    # Install modular library files
    install -d "${pkgdir}/usr/lib/tip"
    install -m644 lib/*.sh "${pkgdir}/usr/lib/tip/"

    # Install license and documentation
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
