pkgname=gnome-shell-extension-better-tray-icons
pkgver=3.5.0
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
sha256sums=('e4e5615d70eb36793ff611a35c6eee7c74c2871e433015a046abdf37d1489cec')

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
