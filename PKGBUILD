# Maintainer: Sleep-No-More <nninkovic95@gmail.com>
pkgname=cpmenu
pkgver=0.0.10
pkgrel=1
pkgdesc="Circular Power Menu - A beautiful donut-shaped power menu for Wayland with smooth animations"
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
sha256sums=('db260cda7943c71c006dd5bf42b550adbf7a8144cd063038e6fa7d0252ab88e4')

build() {
    cd "cpm-${pkgver}"
    meson setup build --prefix=/usr
    ninja -C build
}

package() {
    cd "cpm-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
    
    # Install license (optional)
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || true
}
