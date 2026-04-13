pkgname=adw-network
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern network management application for GNOME (build from source)"
arch=('x86_64')
url="https://github.com/PlayRood32/adw-network"
license=('GPL3')

depends=('gtk4' 'libadwaita' 'gdk-pixbuf2' 'networkmanager')
makedepends=('rust' 'cargo')

provides=('adw-network' 'adwaita-network')
conflicts=('adw-network-bin')

options=('!debug' 'strip')

source=("git+https://github.com/PlayRood32/adw-network.git#tag=v${pkgver}")
sha256sums=('578c3bde81d631aa06cf359d5b5d299d80df3f645101627582ae2a0a17bc519e')

build() {
    cd "${srcdir}/adw-network"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/adw-network"

    # main binary
    install -Dm755 "target/release/adwaita-network" \
        "${pkgdir}/usr/bin/adwaita-network"

    # alias binary
    ln -sf adwaita-network \
        "${pkgdir}/usr/bin/adw-network"

    # desktop file
    install -Dm644 "data/com.github.adw-network.desktop" \
        "${pkgdir}/usr/share/applications/com.github.adw-network.desktop"

    # icon
    install -Dm644 "data/icons/hicolor/scalable/apps/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/icon.png"
}
