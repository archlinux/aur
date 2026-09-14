pkgname=gnome-shell-extension-universal-emoji-chooser
pkgver=1.0.0
pkgrel=1
pkgdesc="Open the native GNOME emoji chooser in any application"
arch=('any')
url="https://github.com/madmoh/gnome-shell-extension-universal-emoji-chooser"
license=('MIT')
depends=('gnome-shell' 'gjs' 'gtk4' 'libadwaita' 'at-spi2-core')
conflicts=("${pkgname}-git")
_uuid='universal-emoji-chooser@madmoh.github.io'
source=("${_uuid}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_uuid}.shell-extension.zip"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/madmoh/gnome-shell-extension-universal-emoji-chooser/v${pkgver}/LICENSE")
noextract=("${_uuid}-${pkgver}.zip")
sha256sums=('210afcc0e55730dccdb0e32f2454f62e720a089e5277165218bc9dad60e19de8'
            '81380b7cff0d2450171b74c270c4994dc2842c2de1067303caef1262875099ba')

package() {
  local extension_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${extension_dir}"
  bsdtar -xf "${_uuid}-${pkgver}.zip" \
    -C "${extension_dir}" --no-same-owner

  install -Dm644 \
    "${extension_dir}/schemas/org.gnome.shell.extensions.universal-emoji-chooser.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -r "${extension_dir}/schemas"

  install -Dm644 "${pkgname}-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
