# Maintainer: Adiker (https://aur.archlinux.org/account/Adiker)
# Repackage the complete, prebuilt GitHub release; no local compilation.
pkgname=epic-games-launcher-proton-bin
pkgver=0.100.0
pkgrel=2
# GitHub release revision is independent of AUR packaging-only revisions.
_release=1
pkgdesc='Native Epic Games Launcher Preview with per-game Proton selection'
arch=('x86_64')
url='https://github.com/Adiker/egl-arch'
license=('MIT' 'LicenseRef-Proprietary')
depends=(
  'bash' 'cairo' 'coreutils' 'dbus' 'dconf' 'gawk' 'gdk-pixbuf2' 'glib2'
  'glibc' 'gtk3' 'gtk4' 'hicolor-icon-theme' 'libadwaita'
  'libayatana-appindicator' 'libgcc' 'libnotify' 'libsoup3' 'libstdc++'
  'libx11' 'systemd' 'util-linux' 'webkit2gtk-4.1' 'xdg-utils'
)
provides=("epic-games-launcher=$pkgver")
conflicts=('epic-games-launcher' 'epic-games-launcher-bin')
# Preserve the tested release's binaries and debug information.
options=('!strip' '!debug')
_archive="${pkgname}-${pkgver}-${_release}-${CARCH}.pkg.tar.zst"
source=("https://github.com/Adiker/egl-arch/releases/download/v${pkgver}-${_release}/${_archive}")
noextract=("${_archive}")
sha256sums=('d798df165587c5ee890503beececf151eccdcf51d86c911088b538509fb1d1ed')

package() {
  # Copy only the payload; makepkg generates fresh package metadata itself.
  bsdtar -xf "$srcdir/$_archive" -C "$pkgdir" opt usr
}
