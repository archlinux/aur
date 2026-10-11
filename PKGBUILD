# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: rina <me@rina.icu>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: hifter <musejinggai@outlook.com>

_pkgname="crosspaste"
pkgname="${_pkgname}-desktop-bin"
pkgver=2.2.1.2706
_mver="${pkgver%.*}"
_pver="${pkgver##*.}"
pkgrel=1
pkgdesc="Universal Pasteboard Across Devices"
provides=("${_pkgname}-desktop")
conflicts=("${_pkgname}-desktop")
arch=(x86_64 aarch64)
url="https://github.com/crosspaste/crosspaste-desktop"
license=("AGPL-3.0-or-later")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/${_pkgname}-${_mver}-${_pver}-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/${_pkgname}-${_mver}-${_pver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('9e0629ecc9ec6df6b5b8ab3bf07d00dc93ef696c975d5c7fd7ea3b38169bca9f')
sha256sums_aarch64=('38a1982d6634571c231557e0c6a2ad0141faad85f46bf459a4ca28312a9aa55d')

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
