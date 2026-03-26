# Maintainer: Paulo Aquino <paulequilibrio at gmail dot com>
# Contributor: Paulo Aquino <paulequilibrio at gmail dot com>

pkgname=sway-simple-overlay
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight GTK-based overlay for Sway (Wayland), Conky-like, with multi-monitor support"
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/paulequilibrio/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('057d99595b8f687f78402c560f8c4aff1aaea4d28ed21c04499624e1a4820dbd')


prepare() {
    cd "$srcdir"
    tar -xf "${pkgname}-${pkgver}.tar.gz"
}


package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    # Install main script
    install -Dm755 ${pkgname}.py \
        "$pkgdir/usr/bin/${pkgname}"

    # Install example config
    install -Dm644 config.yaml \
        "$pkgdir/usr/share/${pkgname}/config.yaml.example"

    # Install man page
    install -Dm644 "${pkgname}.1" \
        "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    # Install example CSS
    if [[ -f style.css ]]; then
        install -Dm644 style.css \
            "$pkgdir/usr/share/${pkgname}/style.css.example"
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
