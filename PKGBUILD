# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
# https://github.com/nihalxkumar/pkgbuilds
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=ensu-bin
_pkgname=ensu
pkgver=0.1.16
pkgrel=1
pkgdesc="Ente's local LLM app - private, offline AI chat (Tauri)"
arch=('x86_64')
url="https://ente.com/ensu"
_url="https://github.com/ente-io/ente"
license=('AGPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(
  'webkit2gtk'
  'gtk3'
)
source=("${_pkgname}_${pkgver}_amd64.deb::${_url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('4f81d04c028f9b8d58ac375e5ddd0107e56584285071c237b2c311215ef330ca')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  desktop-file-edit --set-key=StartupWMClass --set-value=io.ente.ensu \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  desktop-file-edit --set-key=Categories --set-value='Utility;' \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
