# Maintainer: czyt <czytcn@gmail.com>
pkgname=cromma-code-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="The playful desktop terminal for Claude Code and Codex: watch agents work as a game and dispatch worker bees"
arch=('x86_64')
url="https://cromma.ai/code"
license=('LicenseRef-Proprietary')
depends=('curl' 'alsa-lib' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader' 'mesa' 'gcc-libs' 'hicolor-icon-theme')
optdepends=('vulkan-radeon: AMD GPU support'
            'vulkan-intel: Intel GPU support'
            'nvidia-utils: NVIDIA GPU support')
provides=('crommacode')
conflicts=('crommacode')
options=('!strip' '!debug')

# Mutable updater feed: latest.json is overwritten in place on every release,
# so the deb URL has no version and makepkg must not reuse cached downloads.
source=("crommacode-${pkgver}.deb::https://dl.cromma.ai/code/artifacts/${pkgver}/CrommaCode-${pkgver}-linux-amd64.deb")
noextract=("crommacode-${pkgver}.deb")
sha256sums=('757a10f1fa0dc13c5d08665dd61b7110640c1d8153b7e900d7ed5a411da41cf8')

package() {
    # Keep the upstream layout: binaries live in /opt/crommacode and
    # /usr/bin/crommacode is a symlink to the main GUI.
    bsdtar -xOf "${srcdir}/crommacode-${pkgver}.deb" 'data.tar.*' |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"
}
