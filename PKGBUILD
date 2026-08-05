# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
# https://github.com/nihalxkumar/pkgbuilds
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=ensu-bin
_pkgname=ensu
pkgver=0.1.18
pkgrel=1
pkgdesc="Ente's local LLM app - private, offline AI chat (Tauri)"
arch=('x86_64')
url="https://ente.com/ensu"
_url="https://github.com/ente-io/ente"
license=('AGPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug' '!strip')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
)
source=("${_pkgname}_${pkgver}_amd64.deb::${_url}/releases/download/${_pkgname}-v${pkgver}/Ensu_${pkgver}_amd64.deb")
sha256sums=('60573f46bcd063748f65112e3c26f31e9e222b79c3a192b858229f288403b532')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  desktop-file-edit --set-key=StartupWMClass --set-value=io.ente.ensu \
    "${pkgdir}/usr/share/applications/Ensu.desktop"
  desktop-file-edit --set-key=Categories --set-value='Utility;' \
    "${pkgdir}/usr/share/applications/Ensu.desktop"
}