pkgname=gnome-shell-extension-super-key
pkgver=11
pkgrel=1
pkgdesc="Binds the Super key to a custom action"
arch=('any')
url="https://github.com/Tommimon/super-key"
license=('GPL-3.0-only')
depends=('gnome-shell')
_uuid='super-key@tommimon.github.com'
source=("${_uuid}-v${pkgver}.zip::${url}/releases/download/v${pkgver}/${_uuid}.v${pkgver}.shell-extension.zip")
noextract=("${_uuid}-v${pkgver}.zip")
sha256sums=('d4c9d8b11c82e97d2cdc0ef324a7eddf2096b3ab546f622709d91eae81acee69')

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
