pkgname=adw-network
pkgver=0.1.4
pkgrel=1
pkgdesc="Modern network management application for GNOME (build from source)"
arch=('x86_64')
url="https://github.com/PlayRood32/adw-network"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'gdk-pixbuf2' 'networkmanager')
makedepends=('rust' 'base-devel')
provides=('adw-network')
conflicts=('adw-network-bin')

source=("git+https://github.com/PlayRood32/adw-network.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/adw-network" || exit 1

    cargo build --release

    install -Dm755 target/release/adwaita-network "$pkgdir/usr/bin/adwaita-network"

    install -Dm644 data/com.github.adw-network.desktop \
        "$pkgdir/usr/share/applications/com.github.adw-network.desktop"

    install -Dm644 data/icons/hicolor/scalable/apps/icon.png \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/icon.png"
}

