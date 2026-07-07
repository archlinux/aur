# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=soredowe
pkgver=0.4.4
pkgrel=1
pkgdesc="Experimental GUI for pacman/AUR users who prefer it (Wayland/Vulkan)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/soredowe"
license=('GPL3')
depends=(
  'pacman'
  'flatpak'
  'polkit'
  'wayland'
  'vulkan-icd-loader'
  'fontconfig'
  'hicolor-icon-theme'
)
makedepends=('rustup' 'base-devel')
options=('!lto')
provides=('soredowe')
conflicts=('soredowe-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mlm-games/soredowe/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked -p app_shell
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/app_shell" "${pkgdir}/usr/bin/soredowe"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/soredowe.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=soredowe
Comment=GUI for pacman/AUR users who prefer it (Wayland/Vulkan)
Exec=soredowe
Icon=soredowe
Terminal=false
Type=Application
Categories=System;PackageManager;
StartupNotify=true
DESKTOP_EOF

  install -Dm644 "packaging/icons/hicolor/scalable/apps/soredowe.svg" \
    "${pkgdir}/usr/share/pixmaps/soredowe.svg"
}
