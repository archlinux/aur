# Maintainer: Your Name <you@example.com>

pkgname=gta-vcs-recomp-bin
pkgver=0.3.0
pkgrel=2
pkgdesc='Native GTA: Vice City Stories recompilation launcher (prebuilt AppImage; requires your own PS2 USA ISO)'
arch=('x86_64')
url='https://github.com/gothamor/gta-vcs-recomp'
license=('GPL-3.0-only')
# The AppImage supplies the launcher, but the game is compiled locally.
# These are the Arch Linux equivalents of upstream's tools/toolchain.py
# LINUX_DEPS, plus CMake and Ninja to avoid first-run tool downloads.
depends=(
  'fuse2'
  'python'
  'vulkan-icd-loader'
  'git'
  'pkgconf'
  'clang>=19'
  'lld'
  'llvm'
  'cmake'
  'ninja'
  'glslang'
  'ffmpeg'
  # SDL3 is built from source with X11 and Wayland support.
  'libx11'
  'libxext'
  'libxrandr'
  'libxcursor'
  'libxi'
  'libxfixes'
  'libxss'
  'wayland'
  'wayland-protocols'
  'libxkbcommon'
  'libdecor'
  'pipewire'
  'libpulse'
  'alsa-lib'
  'systemd-libs'
  'dbus'
)
provides=('gta-vcs-recomp')
conflicts=('gta-vcs-recomp')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/VCS-Recomp-${pkgver}-x86_64.AppImage")
# Replace SKIP with the SHA-256 of the downloaded AppImage before submitting to AUR.
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/${pkgname}/VCS-Recomp.AppImage"

  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
  ln -s "/opt/${pkgname}/VCS-Recomp.AppImage" \
    "${pkgdir}/usr/bin/gta-vcs-recomp"

  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=GTA: Vice City Stories Recomp
Comment=Build and play GTA: Vice City Stories from your own PS2 disc
Exec=gta-vcs-recomp
Icon=applications-games
Terminal=false
Categories=Game;
StartupNotify=true
DESKTOP
}
