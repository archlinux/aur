# Maintainer: n0yd <deehark87 at gmail dot com>

pkgname=ridge-racer-type-4-pc-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Native PC port of Ridge Racer Type 4 (upstream binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/khasinski/ridge-racer-type-4-pc'
license=('LicenseRef-Upstream' 'MPL-2.0' 'MIT' 'Zlib' 'BSD-3-Clause' 'OFL-1.1')
depends=('glibc' 'vulkan-icd-loader')
optdepends=(
  'vulkan-driver: Vulkan rendering with a GPU-specific ICD'
  'wayland: Wayland window backend'
  'libdecor: client-side window decorations on Wayland'
  'libxkbcommon: Wayland keyboard support'
  'libx11: X11 window backend'
  'libxcursor: X11 cursor support'
  'libxext: X11 window extensions'
  'libxfixes: X11 cursor and pointer support'
  'libxi: X11 extended input support'
  'libxrandr: X11 display mode support'
  'libxss: X11 screensaver inhibition'
  'libxtst: X11 input and screensaver integration'
  'libpulse: PulseAudio or PipeWire-Pulse audio'
  'alsa-lib: ALSA audio'
  'systemd-libs: udev support for input devices'
  'gtk3: native file picker fallback'
)
provides=('ridge-racer-type-4-pc')
conflicts=('ridge-racer-type-4-pc')
options=('!strip' '!debug')

_archive="Ridge-Racer-Type-4-${pkgver}-linux"
source_x86_64=("${url}/releases/download/${pkgver}/${_archive}-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_archive}-arm64.tar.gz")
sha256sums_x86_64=('52c04253697b451214c88a62e1bec46c3c00ba763f6013031b29c21f6e94fdc5')
sha256sums_aarch64=('6c3da1268601e63441a75a7eccbf3de73ba9b6acb54abc4c13ade81c19012e61')

package() {
  local upstream_arch="${CARCH/aarch64/arm64}"
  local license_dir="${pkgdir}/usr/share/licenses/${pkgname}"
  local doc_dir="${pkgdir}/usr/share/doc/${pkgname}"

  cd "${srcdir}/${_archive}-${upstream_arch}"

  install -Dm755 ridge-racer-type-4-pc "${pkgdir}/usr/bin/ridge-racer-type-4-pc"
  install -Dm644 ridge-racer-type-4.png "${pkgdir}/usr/share/pixmaps/ridge-racer-type-4.png"
  install -Dm644 -t "${license_dir}" LICENSE.md THIRD_PARTY_NOTICES.md
  cp -R licenses/. "${license_dir}/"
  install -Dm644 -t "${doc_dir}" README.md CHANGELOG.md source-commit.txt

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/ridge-racer-type-4-pc.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Ridge Racer Type 4
Exec=ridge-racer-type-4-pc
Icon=ridge-racer-type-4
Terminal=false
Categories=Game;SportsGame;
DESKTOP
}
