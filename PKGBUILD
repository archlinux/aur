# Maintainer: Sleep-No-More <nninkovic95@gmail.com>
pkgname=cpm
pkgver=0.0.1
pkgrel=1
pkgdesc="Circular Power Menu - A beautiful donut-shaped power menu for Wayland"
arch=('x86_64')
url="https://github.com/Sleep-No-More/cpm"
license=('MIT')
depends=('gtk3' 'gtk-layer-shell' 'librsvg' 'hyprlock')
makedepends=('meson' 'ninja')
optdepends=(
    'waybar: for integration with waybar'
    'hyprland: optimized for hyprland compositor'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Sleep-No-More/cpm/archive/v${pkgver}.tar.gz")
sha256sums=('c225e86375529e2b5644a8fa4afe219799ea2a666dabdb6676a47d4fd5c44c91')

build() {
    cd "${pkgname}-${pkgver}"
    meson setup build --prefix=/usr
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    ninja -C build install --destdir="${pkgdir}"
    
    # Install license (optional)
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || true
}