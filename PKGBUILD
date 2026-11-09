# Maintainer: rouhim <rouhim@users.noreply.github.com>
# Prebuilt binary from the upstream GitHub release. The archive carries
# baseline-x86-64 code (TRANSCRIBE_X86_CONSERVATIVE), not -march=native.
pkgname=littera-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Local voice dictation for Linux/Wayland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/RouHim/littera"
license=('MIT')
depends=('glibc>=2.44' 'alsa-lib' 'vulkan-icd-loader' 'blas' 'cblas')
optdepends=(
    'xdg-desktop-portal: bind the hotkey through the GlobalShortcuts portal'
    'pipewire: microphone capture through the ALSA plugin'
    'xdg-utils: open the model folder from the settings window'
)
provides=('littera')
conflicts=('littera')
install=littera-bin.install
options=(!strip)
source_x86_64=("$url/releases/download/v$pkgver/littera-$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('57dc89e93dcfab2d3d64b28ef763740237a5792ead969d3375f4f5deacb0b67a')

package() {
    local src="$srcdir/littera-$pkgver-x86_64"

    install -Dm755 "$src/littera" "$pkgdir/usr/bin/littera"
    install -Dm644 "$src/littera.desktop" "$pkgdir/usr/share/applications/littera.desktop"
    install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d "$pkgdir/usr/share/icons"
    cp -R "$src/icons/hicolor" "$pkgdir/usr/share/icons/"
}
