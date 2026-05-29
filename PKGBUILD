# Maintainer: Lumina <luminanao at duck.com>
pkgname=limit-computer-time
pkgver=1.0.1
pkgrel=1
pkgdesc="Daily desktop time budget daemon for KDE Plasma on Wayland with countdown overlay and TUI configurator"
arch=(x86_64)
url="https://codeberg.org/LuminaNAO/limit-computer-time"
license=(AGPL3)
depends=(gtk3 gtk-layer-shell)
makedepends=(rust)
optdepends=(
    "pipewire-alsa: alarm sound playback via pw-play"
    "pulseaudio-alsa: alarm sound playback fallback via paplay"
    "libcanberra: alarm sound fallback via canberra-gtk-play"
    "qdbusqt6: KDE Plasma screen lock integration"
    "qdbusqt5: KDE Plasma screen lock fallback"
    "logind: session lock detection fallback"
)
source=(git+https://codeberg.org/LuminaNAO/limit-computer-time.git#tag="v${pkgver}")
sha256sums=(SKIP)

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release 
}

check() {
    cd "${srcdir}/${pkgname}"
    cargo test --release 
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 target/release/lct "${pkgdir}/usr/bin/lct"
    install -Dm755 target/release/timer-overlay "${pkgdir}/usr/bin/timer-overlay"
    install -Dm755 target/release/limit-computer-time-tui "${pkgdir}/usr/bin/limit-computer-time-tui"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
