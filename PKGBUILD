pkgname=gnome-shell-extension-better-tray-icons
pkgver=3.2.3
pkgrel=1
pkgdesc="Brings tray icons back to the GNOME top panel, with an overflow popup behind a toggle button, per-app renaming and icon overrides, configurable click actions and settings sync. Wayland only."
arch=('any')
url="https://github.com/nexaknight/BetterTrayIcons"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
conflicts=("${pkgname}-git")
_uuid='BetterTrayIcons@nexaknight.com'
source=("${_uuid}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_uuid}.zip")
noextract=("${_uuid}-${pkgver}.zip")
sha256sums=('2e56416ab91268a78e6a9bd44baaf55ba8e79b34d7d84a9399320214c6e0c537')

package() {
  local extension_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${extension_dir}"
  bsdtar -xf "${_uuid}-${pkgver}.zip" \
    -C "${extension_dir}" --no-same-owner

  install -Dm644 \
    "${extension_dir}/schemas/org.gnome.shell.extensions.bettertrayicons.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -r "${extension_dir}/schemas"
}
