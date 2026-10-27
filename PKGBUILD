# Maintainer: mak <mak@localhost>
#
# Separate SrShadowy BBPort 0.6.7 test package. It installs beside the Lantern
# Engine package: it does not touch /usr/bin/bloodborne-pc or
# /opt/ports/bloodborne-pc. The game dump is expected at
# ~/Games/BloodBorne/game/CUSA03173; override BB_GAME_DIR if needed. Saves and
# generated files go to ~/.local/share/bbport-srshadowy.
#
# Upstream 0.6.7 adds the native BBSC relay, FPS HUD/telemetry and DualSense/DS4
# improvements. The Lantern Engine online patch does not apply to this package.

pkgname=bloodborne-pc-srshadowy-bin
pkgver=0.6.7
pkgrel=1
pkgdesc="Bloodborne native PC port (SrShadowy BBPort 0.6.7, separate test build, requires your own game dump)"
arch=('x86_64')
url="https://github.com/SrShadowy/bloodborne_pc"
license=('GPL-2.0-or-later')
depends=('bash'
         'glibc'
         'gcc-libs'
         'python'
         'python-gobject'
         'gtk4'
         'libadwaita'
         'vulkan-icd-loader'
         'openssl'
         'zlib'
         'brotli'
         'zstd'
         'systemd-libs'
         'libx11'
         'libxcb'
         'libxkbcommon'
         'libxrandr'
         'libxi'
         'libxcursor'
         'libxext'
         'wayland'
         'libdecor'
         'libglvnd'
         'fontconfig'
         'freetype2'
         'alsa-lib')
optdepends=('mangohud: Vulkan performance overlay'
            'nvidia-utils: NVIDIA Vulkan driver / DLSS'
            'pipewire: PipeWire audio'
            'pulseaudio: PulseAudio audio')
options=('!strip' '!debug')
source=("BBPort-${pkgver}-1-linux-x86_64.tar.gz::https://github.com/SrShadowy/bloodborne_pc/releases/download/${pkgver}/BBPort-${pkgver}-1-linux-x86_64.tar.gz"
        'bloodborne-pc-srshadowy'
        'bloodborne-pc-srshadowy.desktop'
        'bloodborne-pc-srshadowy.png'
        'LICENSE')
sha256sums=('2dce1de9ce155d41a66bb35b9ed4230c19ef450156b019e2b57f98f48f515a76'
            '84836325d4536afd096652a5813e4ebcb90a775da7af95949924d62264bc089f'
            '98c1087cd6441850b00634d77879b2628543a9530189dfebf92196175ae28cfd'
            '43acf16390fd766a90d7c19f3c5b80803ae6b354cecc15ff5e60fbb39d6c1abb'
            'edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6')

package() {
  install -d "$pkgdir/opt/ports/bloodborne-pc-srshadowy"
  cp -a --no-preserve=ownership \
    "$srcdir/BBPort-${pkgver}-1-linux-x86_64/." \
    "$pkgdir/opt/ports/bloodborne-pc-srshadowy/"

  find "$pkgdir/opt/ports/bloodborne-pc-srshadowy" \
    -type d -name __pycache__ -prune -exec rm -rf -- {} +

  install -Dm755 "$srcdir/bloodborne-pc-srshadowy" \
    "$pkgdir/usr/bin/bloodborne-pc-srshadowy"
  install -Dm644 "$srcdir/bloodborne-pc-srshadowy.desktop" \
    "$pkgdir/usr/share/applications/bloodborne-pc-srshadowy.desktop"
  install -Dm644 "$srcdir/bloodborne-pc-srshadowy.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/bloodborne-pc-srshadowy.png"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
