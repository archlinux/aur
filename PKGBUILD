# Maintainer: Paulo Aquino <paulequilibrio at gmail dot com>

pkgname=sway-simple-overlay
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight GTK-based overlay for Sway (Wayland) with multi-monitor support"
arch=('any')
url="https://github.com/paulequilibrio/sway-simple-overlay"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk3'
    'gtk-layer-shell'
    'python-yaml'
)
makedepends=('git')
install=$pkgname.install
source=("https://github.com/paulequilibrio/sway-simple-overlay/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('18cf31e145884869d3be7ac69d50917ed2f723cbdfae83daa5d9f6ffd342f6f3')


prepare() {
    cd "$srcdir"
    tar -xf "v${pkgver}.tar.gz"
}


package() {
    cd "$srcdir/sway-simple-overlay-${pkgver}"

    # Install main script
    install -Dm755 sway-simple-overlay.py \
        "$pkgdir/usr/bin/sway-simple-overlay"

    # Install example config
    install -Dm644 config.yaml \
        "$pkgdir/usr/share/sway-simple-overlay/config.yaml.example"

    # Install example CSS
    if [[ -f style.css ]]; then
        install -Dm644 style.css \
            "$pkgdir/usr/share/sway-simple-overlay/style.css.example"
    fi

    # Install license
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    # Install README
    if [[ -f README.md ]]; then
        install -Dm644 README.md \
            "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
