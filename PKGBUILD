pkgname=gnome-shell-extension-vicinae
pkgver=1.7.2
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
sha256sums=('d0d79c762c7cac44941d4f74617b156c3a27df255320b8c81a20a3fe1f17284a')

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
