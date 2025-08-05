# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: hifter <musejinggai@outlook.com>

_pkgname="crosspaste"
pkgname="${_pkgname}-desktop-bin"
pkgver=1.2.1.1551
_mver="${pkgver%.*}"
_pver="${pkgver##*.}"
pkgrel=1
pkgdesc="Universal Pasteboard Across Devices"
provides=("${_pkgname}-desktop")
conflicts=("${_pkgname}-desktop")
arch=("x86_64")
url="https://crosspaste.com"
license=("AGPL-3.0-or-later")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/CrossPaste/${_pkgname}-desktop/releases/download/${pkgver}/${_pkgname}-${_mver}-${_pver}-linux-amd64.tar.gz")
sha256sums=('sha256:bb99a49e907da266ca6f7906dba4b876c4dd56bb59fd7ad69a44604057f5aac7')
prepare() {
  sed -E \
    -e "s|Exec=.*|Exec=/usr/bin/${_pkgname}|g" \
    -e "s|Categories=.*|Categories=GTK;Gnome;Utility;|" \
    -i "${_pkgname}-${_mver}/share/applications/com.${_pkgname}.desktop"
}

package() {
  install -dm755 "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -r --preserve=mode "${_pkgname}-${_mver}" "${pkgdir}/opt/${_pkgname}"
  ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  mv "${pkgdir}/opt/${_pkgname}/share" "${pkgdir}/usr"
}
