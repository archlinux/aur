# Maintainer: Sleep-No-More <nninkovic95@gmail.com>
pkgname=cpmenu
pkgver=0.0.3
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
sha256sums=('3a361d4fc9211c4bd80d49ea6b980c361256e12ba77a3ead768f497599970c6c')

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
