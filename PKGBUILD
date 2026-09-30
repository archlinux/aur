pkgname=gnome-shell-extension-better-tray-icons
pkgver=3.3.1
pkgrel=1
pkgdesc="Brings tray icons back to the GNOME top panel, with an overflow popup behind a toggle button, per-app renaming and icon overrides, configurable click actions and settings sync. Wayland only."
arch=('any')
url="https://github.com/nexaknight/BetterTrayIcons"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('gettext')
conflicts=("${pkgname}-git")
_uuid='BetterTrayIcons@nexaknight.com'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('37dcb0b3a37754dc05271a075bcb939df8c5e2dfd96f614c1cefe1981c5b787b')

build() {
  make -C "BetterTrayIcons-${pkgver}" pack
}

package() {
  local extension_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${extension_dir}"
  bsdtar -xf "BetterTrayIcons-${pkgver}/${_uuid}.shell-extension.zip" \
    -C "${extension_dir}" --no-same-owner

  install -Dm644 \
    "${extension_dir}/schemas/org.gnome.shell.extensions.bettertrayicons.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -r "${extension_dir}/schemas"
}
