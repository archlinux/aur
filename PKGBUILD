# Maintainer: neko_ayaya
# Maintainer: liblaf <30631553+liblaf@users.noreply.github.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=mihomo-smart-bin
pkgver=1.19.34.alpha.smart.r4831.g4624551
pkgrel=1
pkgdesc='The universal proxy platform.'
arch=('x86_64')
url='https://wiki.metacubex.one/'
license=('GPL-3.0-or-later')
groups=('net')
provides=('mihomo' 'clash-meta')
conflicts=('mihomo' 'clash-meta')
backup=('etc/mihomo/config.yaml')
options=('!strip' '!debug')
install=mihomo-smart-bin.install

_commit=4624551
# SHA256 of the upstream binary package archive.
_binary_sha256='4cb24fcdde56b0471f0948abcdc82489fe20e57164d618fca7a850438cb80ce6'
_model_sha256='832920df1290454710dd04aa4c7d4b5324edfd7816a7c9ad2272708b5d5a13a8'

source=(
  "mihomo-${_commit}.pkg.tar.zst::https://github.com/vernesong/mihomo/releases/download/Prerelease-Alpha/mihomo-linux-amd64-v3-alpha-smart-${_commit}.pkg.tar.zst"
  'Model.bin::https://github.com/vernesong/mihomo/releases/download/LightGBM-Model/Model-large.bin'
)
sha256sums=(
  "${_binary_sha256}"
  "${_model_sha256}"
)
noextract=("mihomo-${_commit}.pkg.tar.zst")

package() {
  bsdtar -xf "${srcdir}/mihomo-${_commit}.pkg.tar.zst" -C "${pkgdir}" usr etc
  install -Dm644 "${srcdir}/Model.bin" "${pkgdir}/etc/mihomo/Model.bin"
}
