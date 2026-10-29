# Maintainer: neko_ayaya
# Maintainer: liblaf <30631553+liblaf@users.noreply.github.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=mihomo-smart-bin
pkgver=20261021.194528.g4624551
pkgrel=1
pkgdesc='Binary version of Mihomo with Smart proxy groups'
arch=('x86_64')
url='https://github.com/vernesong/mihomo'
license=('GPL-3.0-or-later')
depends=('glibc')
provides=('mihomo' 'clash-meta')
conflicts=('mihomo' 'clash-meta')
backup=('etc/mihomo/config.yaml')
options=('!strip' '!debug')
install=mihomo-smart-bin.install

_commit=4624551
_binary_sha256='e170cbfcef269cf1384c1273001d021e0306f6cc0847d5399a05d6cdfffe14c2'
_model_sha256='832920df1290454710dd04aa4c7d4b5324edfd7816a7c9ad2272708b5d5a13a8'

source=(
  'mihomo.service::https://raw.githubusercontent.com/MetaCubeX/mihomo/refs/tags/v1.19.19/.github/release/mihomo.service'
  'config.yaml::https://raw.githubusercontent.com/MetaCubeX/mihomo/refs/tags/v1.19.19/.github/release/config.yaml'
  "mihomo-${_commit}.gz::https://github.com/vernesong/mihomo/releases/download/Prerelease-Alpha/mihomo-linux-amd64-v3-alpha-smart-${_commit}.gz"
  'Model.bin::https://github.com/vernesong/mihomo/releases/download/LightGBM-Model/Model-large.bin'
)
sha256sums=(
  'b4b011a4b5670b09cc7d21a73cbaf47e038ff3f504deb16afab460555572f3a4'
  '65696f4b2ac4ec31987b3783b712a2452418cbe464c23b648fca2a515e478377'
  "${_binary_sha256}"
  "${_model_sha256}"
)

package() {
  install -Dm755 "${srcdir}/mihomo-${_commit}" "${pkgdir}/usr/bin/mihomo"
  install -Dm644 "${srcdir}/config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
  install -Dm644 "${srcdir}/Model.bin" "${pkgdir}/etc/mihomo/Model.bin"
  install -Dm644 "${srcdir}/mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
}
