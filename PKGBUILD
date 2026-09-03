# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=fastpotify-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Native Spotify client"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/fastpotify"
license=('MIT')
install="${pkgname}.install"
# alsa-lib and libpulse are linked directly; the rest are dlopened by winit
# and glutin at startup, and this is a GUI-only application, so all of them
# have to be there for it to run at all.
depends=('alsa-lib' 'libpulse' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11')
optdepends=('libxkbcommon-x11: keyboard handling in X11 sessions'
            'pipewire-pulse: PipeWire as the PulseAudio server')
provides=('fastpotify')
conflicts=('fastpotify' 'fastpotify-git')
options=('!debug' '!strip')
_repo="https://github.com/crmne/fastpotify"
source_x86_64=("${_repo}/releases/download/v${pkgver}/fastpotify-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/fastpotify-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('15722e2591812d08304f3503ffb9b1e34e73c8786148130fef9c877c1e2b0b12')
sha256sums_aarch64=('cc510a3fef5e8645f588c4f7e4d242e677fd8b08cc150fef213ca0e4d4aa05f9')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-gnu" ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  local dir="${srcdir}/fastpotify-v${pkgver}-${target}"

  install -Dm755 "${dir}/fastpotify" "${pkgdir}/usr/bin/fastpotify"
  install -Dm644 "${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${dir}/packaging/applications/fastpotify.desktop" \
    "${pkgdir}/usr/share/applications/fastpotify.desktop"
  install -Dm644 "${dir}/packaging/icons/fastpotify.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/fastpotify.svg"
}
