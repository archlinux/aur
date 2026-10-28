# Maintainer: Andrea Debernardi <https://github.com/debba>
# Updated by .github/workflows/release.yml in https://github.com/debba/discophile for every release.

pkgname=discophile-bin
_pkgname=discophile
pkgver=1.0.2
pkgrel=1
pkgdesc='Your music server, played like a record collection: a player for Navidrome, Subsonic, Jellyfin and Audiobookshelf'
arch=('x86_64')
url='https://discophile.app'
license=('MIT')
# Linked: alsa-lib, dbus, gcc-libs, glibc. Loaded at runtime by the window and OpenGL backends (winit, glutin):
# libglvnd (EGL, GL), libx11, libxcb, libxcursor, libxi, libxrender, libxkbcommon(-x11) and wayland.
depends=('alsa-lib' 'dbus' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libxcb' 'libxcursor'
         'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'wayland')
optdepends=('pipewire-alsa: play through PipeWire'
            'pulseaudio-alsa: play through PulseAudio'
            'gnome-keyring: keep passwords in a Secret Service keyring (KeePassXC and KWallet work too)'
            'xdg-desktop-portal: file dialogs for imports')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/debba/discophile/releases/download/v${pkgver}/Discophile-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('14427a3433a28fb0f4b99d9853c7af5ffd38043c94b35ca8141c72f7e240efea')

package() {
  cd Discophile
  install -Dm755 discophile "${pkgdir}/usr/bin/discophile"
  install -Dm644 discophile.desktop "${pkgdir}/usr/share/applications/discophile.desktop"
  install -Dm644 discophile.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/discophile.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
