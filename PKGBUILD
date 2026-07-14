pkgname=adw-network
pkgver=1.0.2
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
sha256sums=('SKIP')

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
