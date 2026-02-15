pkgname=adw-network
pkgver=0.1.5
pkgrel=1
pkgdesc="Modern network management application for GNOME (build from source)"
arch=('x86_64')
url="https://github.com/PlayRood32/adw-network"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'gdk-pixbuf2' 'networkmanager')
makedepends=('rust' 'cargo')
provides=('adw-network')
conflicts=('adw-network-bin')
options=('!debug' 'strip')

source=("git+https://github.com/PlayRood32/adw-network.git#tag=v${pkgver}")
sha256sums=('7707c5179f0b4525525473d3923ac228ed2167a6710ed4f6c5a7ee6bf94b603c')

build() {
    cd "${srcdir}/adw-network"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/adw-network"
    
    install -Dm755 "target/release/adwaita-network" "${pkgdir}/usr/bin/adwaita-network"
    
    install -Dm644 "data/com.github.adw-network.desktop" \
        "${pkgdir}/usr/share/applications/com.github.adw-network.desktop"
    
    install -Dm644 "data/icons/hicolor/scalable/apps/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/icon.png"
}
