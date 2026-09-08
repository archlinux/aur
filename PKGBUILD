pkgname=gnome-shell-extension-super-key
pkgver=10
pkgrel=1
pkgdesc="Binds the Super key to a custom action"
arch=('any')
url="https://github.com/Tommimon/super-key"
license=('GPL-3.0-only')
depends=('gnome-shell')
_uuid='super-key@tommimon.github.com'
source=("${_uuid}-v${pkgver}.zip::${url}/releases/download/v${pkgver}/${_uuid}.v${pkgver}.shell-extension.zip")
noextract=("${_uuid}-v${pkgver}.zip")
sha256sums=('43ca3aa4182f7351fe2ce355113312f10740960ad03fad24698f72358d110b42')

package() {
  local extension_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${extension_dir}"
  bsdtar -xf "${_uuid}-v${pkgver}.zip" \
    -C "${extension_dir}" --no-same-owner

  install -Dm644 \
    "${extension_dir}/schemas/org.gnome.shell.extensions.super-key.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -r "${extension_dir}/schemas"
}
