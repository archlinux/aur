# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: rina <me@rina.icu>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: hifter <musejinggai@outlook.com>

_pkgname="crosspaste"
pkgname="${_pkgname}-desktop-bin"
pkgver=2.1.7.2461
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
sha256sums_x86_64=('98485f853ef25b4bc771ca36d04a8a2ec13ef35e0ecc76b2364198db09541605')
sha256sums_aarch64=('af89e0225812135afdea7e12f9a136cf0e4c70f015fa6ec8abeea153cc031b7e')

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
