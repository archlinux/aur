pkgname=r4ge-bin
pkgver=1.0.0
pkgrel=2
_release="${pkgver}-20261127-883b698e"
_tag="stable-${_release}"
pkgdesc='Godot reimplementation of Ridge Racer Type 4 using data from your own US disc image'
arch=('x86_64')
url='https://gitlab.com/snake_p/r4ge'
# Replace the LicenseRef once upstream confirms the project's license.
license=('LicenseRef-R4GE-Undeclared' 'OFL-1.1')
depends=('glibc' 'bash' 'hicolor-icon-theme' 'vulkan-icd-loader' 'vulkan-driver' 'libglvnd' 'libx11'
         'libxcursor' 'libxext' 'libxi' 'libxinerama' 'libxrandr' 'libxrender'
         'fontconfig' 'libxkbcommon' 'wayland' 'systemd-libs')
optdepends=('alsa-lib: ALSA audio'
            'libpulse: PulseAudio or PipeWire-Pulse audio'
            'libdecor: Wayland window decorations'
            'sdl3: steering wheel force feedback')
provides=("r4ge=${pkgver}")
conflicts=('r4ge')
options=('!strip' '!debug')
source=("R4GE-${_release}-linux.zip::https://gitlab.com/api/v4/projects/88368336/packages/generic/r4ge/${_release}/R4GE-${_release}-linux.zip"
        "${url}/-/archive/${_tag}/r4ge-${_tag}.tar.gz"
        'r4ge'
        'r4ge.desktop')
sha256sums=('e8d2cca45d02290af48fb3e33ba0cac757978950ddac0ee5582c329ab8111a56'
            'e5939f05754b5c55110452eb8abf10000028ae328f95c87fff53180ef8f033a0'
            'd93ebe8fb40c5e1e0074b2a3ce88aa385f2cd82bf6282be366d867ffc591d95d'
            '739a118edf7f58b287d002d926a6023d13ab33f9ef011944a319372338c6fab6')

package() {
    local upstream="${srcdir}/r4ge-${_tag}"
    local appdir="${pkgdir}/usr/lib/r4ge"

    install -Dm755 -t "${appdir}" R4GE.$CARCH r4_ffb
    install -Dm644 -t "${appdir}" R4GE.pck libr4native.linux.release.$CARCH.so
    install -Dm755 r4ge "${pkgdir}/usr/bin/r4ge"
    install -Dm644 r4ge.desktop "${pkgdir}/usr/share/applications/r4ge.desktop"
    install -Dm644 "${upstream}/godot_r4/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/r4ge.svg"
    install -Dm644 "${upstream}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
        "${upstream}/godot_r4/data/fonts/OFL.txt" \
        "${upstream}/godot_r4/data/fonts/OFL_Orbitron.txt"
}
