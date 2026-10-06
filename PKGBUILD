pkgname=gnome-shell-extension-symmetric-resize
pkgver=1.0.0
pkgrel=2
pkgdesc="Resize GNOME windows from the center or with a fixed aspect ratio"
arch=('any')
url="https://github.com/madmoh/gnome-shell-extension-symmetric-resize"
license=('MIT')
depends=('gnome-shell' 'gjs' 'gtk4' 'libadwaita')
conflicts=("${pkgname}-git")
_uuid='symmetric-resize@madmoh.github.io'
source=("${_uuid}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_uuid}.shell-extension.zip"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/madmoh/gnome-shell-extension-symmetric-resize/v${pkgver}/LICENSE")
noextract=("${_uuid}-${pkgver}.zip")
sha256sums=('84d52e6c725a73723096d9acec06d614f7841dd5f3d9d830621bd5e07e8840b7'
            '81380b7cff0d2450171b74c270c4994dc2842c2de1067303caef1262875099ba')

package() {
  local extension_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${extension_dir}"
  bsdtar -xf "${_uuid}-${pkgver}.zip" \
    -C "${extension_dir}" --no-same-owner

  install -Dm644 \
    "${extension_dir}/schemas/org.gnome.shell.extensions.symmetric-resize.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -r "${extension_dir}/schemas"

  install -Dm644 "${pkgname}-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
