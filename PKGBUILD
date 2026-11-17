# Maintainer: mortacious
# Upstream: https://github.com/ProtonLumo/lumo-desktop
#
# Version updates:
#   curl -s https://proton.me/download/lumo/desktop/linux/v1/version.json
# The version.json is signed by Proton and carries the sha512 checksum of the
# .deb - verify it against the sha512sums below after downloading.

pkgname=lumo-desktop-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="Lumo desktop client for Proton's privacy-first AI assistant (official binaries)"
arch=('x86_64')
url="https://proton.me/lumo"
license=('GPL-3.0-only')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'webkit2gtk-4.1'
)
optdepends=(
  'gnome-keyring: secrets storage (recommended)'
  'kwallet: secrets storage (KDE alternative)'
)
source=("https://lumo.protondownload.com/linux/${pkgver}/Lumo_${pkgver}_amd64.deb")
sha512sums=('583cb312424c0874aae03c61afde5653c0104655592ea574a8ae2daef9f61bb750714eb25f37fc396f278519373017b3297c281aa16d273b35746bb561b35e26')

# The Tauri auto-updater built into the app is not functional for native
# (non-AppImage) Linux packages; pacman handles updates instead.
# Upstream tracks releases at:
#   https://github.com/ProtonLumo/lumo-desktop/blob/master/changelog.md

package() {
    cd "${srcdir}"
    ar p "Lumo_${pkgver}_amd64.deb" data.tar.gz | bsdtar -x -C "${pkgdir}"

    # Ensure sane permissions in case the upstream archive ships odd ones
    chmod 755 "${pkgdir}/usr/bin/lumo-desktop"
}
