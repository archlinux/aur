# Maintainer: Avenge Media LLC <avengemediallc at gmail dot com>
_pkgauthor=duxlabs-dev
_repo=dux-greeter
_binname=dms-greeter

pkgname=greetd-dms-greeter-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Greetd login screen with the Dank Material aesthetic (binary release)'
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_repo}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_repo}/v${pkgver}"
_urlrel="${url}/releases/download/v${pkgver}"
license=('MIT')
depends=(
    'greetd'
    'quickshell'
    'qt6-declarative'
)
optdepends=(
    'niri: Niri compositor support'
    'hyprland: Hyprland compositor support'
    'sway: Sway compositor support'
)
provides=('greetd-dms-greeter' "${_binname}=${pkgver}")
conflicts=('greetd-dms-greeter' 'greetd-dms-greeter-git' "${_binname}")
install=greetd-dms-greeter.install

source=(
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "tmpfiles-${_binname}-${pkgver}.conf::${_urlraw}/assets/systemd/tmpfiles-${_binname}.conf"
  "dms-niri-${pkgver}.kdl::${_urlraw}/assets/examples/dms-niri.kdl"
  "dms-hypr-${pkgver}.lua::${_urlraw}/assets/examples/dms-hypr.lua"
  "${_binname}-completions-${pkgver}.tar.gz::${_urlrel}/${_binname}-completions-${pkgver}.tar.gz"
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[1]}.gz")

sha256sums=('0c4c01a73eb7d2d1286a7e60e580dd53b605636dc46a57c9c3318e8e23efc676'
            '44fc17bb46ccdeb46fe06ab27ba2702353dbabb112d14053be3d05a2220ca032'
            '3dc267a18f22d06f595a80fb77275db56fe88c48b838db364ba3a1d307572a50'
            '0376981f71a7331e3a8e5fdf71628f8c0e3881328969011f31fc1da6d54036c0'
            'a3fc6762662f111b16dd7aab7afa028d229cbb14d370a3c81eb5025749cd1211'
            '7e641482ca6d5b1b2164a221d8a985579ce40c843bfdc716de1a136d6da93beb')
sha256sums_x86_64=('81b45cf378d3930733b1758c788c834e394e16a357f71442d722f4806a260158')
sha256sums_aarch64=('32928e9426d00d4c9416ddddfedf1f2a6a4a115adffcfdc2b9579d9a8a8f5190')

package() {
  cd "${srcdir}" || exit 1

  install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"

  install -Dm644 "${_binname}"      "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "_${_binname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"

  install -Dm644 "tmpfiles-${_binname}-${pkgver}.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_binname}.conf"

  install -Dm644 "dms-niri-${pkgver}.kdl"  "${pkgdir}/usr/share/doc/${pkgname}/examples/dms-niri.kdl"
  install -Dm644 "dms-hypr-${pkgver}.lua"  "${pkgdir}/usr/share/doc/${pkgname}/examples/dms-hypr.lua"

  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
