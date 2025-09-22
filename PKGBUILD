# Maintainer: Bruno Ancona <brunoanconasala at gmail dot com>

pkgname=eternalmodmanager
pkgver=4.2.2
pkgrel=1
pkgdesc='Cross-platform mod manager for DOOM Eternal.'
arch=('x86_64')
url='https://github.com/brunoanc/EternalModManager'
license=('MIT')
depends=('gtk4' 'libadwaita' 'openssl')
makedepends=('git' 'cargo')
source=("git+https://github.com/brunoanc/EternalModManager.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "EternalModManager"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "EternalModManager"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}


package() {
    cd "EternalModManager"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/eternal_mod_manager"
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "resources/io.github.brunoanc.eternalmodmanager.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/metainfo/" "resources/io.github.brunoanc.eternalmodmanager.appdata.xml"
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/" "resources/io.github.brunoanc.eternalmodmanager.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/io.github.brunoanc.eternalmodmanager" LICENSE
}
