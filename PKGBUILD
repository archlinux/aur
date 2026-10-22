pkgname=gnome-shell-extension-vicinae
pkgver=1.8.0
pkgrel=1
pkgdesc="Companion GNOME extension for Vicinae with clipboard monitoring and window management APIs"
arch=('any')
url="https://github.com/vicinaehq/gnome-extension"
license=('MIT')
depends=('gnome-shell')
conflicts=("${pkgname}-git")
_uuid='vicinae@dagimg-dot'
source=("${_uuid}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_uuid}.shell-extension-v${pkgver}.zip")
noextract=("${_uuid}-${pkgver}.zip")
sha256sums=('a3cc5db3b5a0c44ecf2f7db5ef0f9b49644cc0d20342f107b2e431c1d85f9956')

package() {
  local extension_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${extension_dir}"
  bsdtar -xf "${_uuid}-${pkgver}.zip" \
    -C "${extension_dir}" --no-same-owner

  install -Dm644 \
    "${extension_dir}/schemas/org.gnome.shell.extensions.vicinae.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -r "${extension_dir}/schemas"

  install -Dm644 "${extension_dir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
