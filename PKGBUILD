# Maintainer: Archisman Panigrahi <apandada1 AT gmail DOT com>
pkgname=wombat
pkgver=0.3.0
pkgrel=1
pkgdesc="Scientific calculator using Numbat programming language with GTK4+libadwaita"
arch=('x86_64' 'aarch64')
url="https://github.com/archisman-panigrahi/wombat"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('rust' 'cargo' 'pkg-config')
options=('!lto')
source=("git+https://github.com/archisman-panigrahi/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"
    cargo build --release
}

package() {
    cd "${pkgname}"
    
    # Install binary
    install -Dm755 target/release/wombat "${pkgdir}/usr/bin/wombat"
    
    # Install desktop file
    install -Dm644 data/io.github.archisman_panigrahi.wombat.desktop \
        "${pkgdir}/usr/share/applications/io.github.archisman_panigrahi.wombat.desktop"
    
    # Install metainfo (AppStream metadata)
    install -Dm644 data/io.github.archisman_panigrahi.wombat.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/io.github.archisman_panigrahi.wombat.metainfo.xml"
    
    # Install icon
    install -Dm644 data/io.github.archisman_panigrahi.wombat.png \
        "${pkgdir}/usr/share/icons/hicolor/64x64/apps/io.github.archisman_panigrahi.wombat.png"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
