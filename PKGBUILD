# Maintainer: Lysec <itslysec@gmail.com>

pkgname=noctalia-shell-git
pkgver=2.3.0.8.g56967d4
pkgrel=1
pkgdesc="A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell. (git version)"
arch=('any')
url="https://github.com/noctalia-dev/noctalia-shell"
license=('MIT')

depends=(
    'quickshell'
    'ttf-roboto'
    'inter-font'
    'ttf-material-symbols-variable-git'
    'gpu-screen-recorder'
    'brightnessctl'
    'ddcutil'
)

optdepends=(
    'cliphist: For clipboard history support'
    'swww: Wallpaper animations and effects'
    'matugen-bin: Material You color scheme generation'
    'cava: Audio visualizer component'
)

makedepends=('git')

provides=('noctalia-shell')
conflicts=('noctalia-shell')

source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/noctalia-shell"
    git describe --tags --long 2>/dev/null | \
    sed 's/^v//' | \
    sed 's/-/./g'
}

package() {
    cd "$srcdir/noctalia-shell"

    # Install shell files to quickshell system config directory
    install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia"
    cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia/"

    # Create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/noctalia-shell" << 'EOF'
#!/bin/bash
exec qs -c noctalia "$@"
EOF
    chmod +x "$pkgdir/usr/bin/noctalia-shell"
}
