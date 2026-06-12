# Maintainer: Jesse Pinkman <M-Igashi@users.noreply.github.com>
pkgname=mp3rgui
pkgver=2.8.0
pkgrel=1
pkgdesc='GUI application for mp3rgain - lossless MP3 volume adjustment'
arch=('x86_64' 'aarch64')
url='https://github.com/M-Igashi/mp3rgain'
license=('MIT')
depends=('gcc-libs' 'gtk3')
makedepends=('rust' 'cargo')
optdepends=('mp3rgain: CLI tool for batch processing')
source=("https://github.com/M-Igashi/mp3rgain/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "mp3rgain-${pkgver}/mp3rgui"
    export CARGO_HOME="${srcdir}/cargo-home"
    cargo build --release --locked
}

check() {
    cd "mp3rgain-${pkgver}/mp3rgui"
    export CARGO_HOME="${srcdir}/cargo-home"
    cargo test --release --locked
}

package() {
    cd "mp3rgain-${pkgver}"
    install -Dm755 mp3rgui/target/release/mp3rgui "${pkgdir}/usr/bin/mp3rgui"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mp3rgui/LICENSE"
    install -Dm644 mp3rgui/icons/icon_128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mp3rgui.png"
    install -Dm644 mp3rgui/icons/icon_64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mp3rgui.png"
    install -Dm644 mp3rgui/icons/icon_48x48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/mp3rgui.png"
    install -Dm644 mp3rgui/icons/icon_32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/mp3rgui.png"
    install -Dm644 mp3rgui/icons/icon_16x16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/mp3rgui.png"
    install -Dm644 packages/aur-gui/mp3rgui.desktop "${pkgdir}/usr/share/applications/mp3rgui.desktop"
}
