# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=duxlabs-dev
_repo=dux-greeter
_binname=dms-greeter

pkgname=dux-greeter-bin
pkgver=2.1.1
pkgrel=1
pkgdesc='Greetd login screen with the Dux Shell aesthetic (prebuilt binary)'
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
provides=('greetd-dms-greeter' "${_binname}=${pkgver}" "${_repo}=${pkgver}")
conflicts=('greetd-dms-greeter' 'greetd-dms-greeter-bin' 'greetd-dms-greeter-git' 'dux-greeter-git' "${_binname}" "${_repo}")
replaces=('greetd-dms-greeter-bin')
install=dux-greeter.install

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
            '40331d18c29600ea9858d6e78099a80044b5a1b2dfc5d5201120b48876d1155d'
            '3dc267a18f22d06f595a80fb77275db56fe88c48b838db364ba3a1d307572a50'
            '0376981f71a7331e3a8e5fdf71628f8c0e3881328969011f31fc1da6d54036c0'
            '1697f1cf527a911d08b7cd4dd935727ecc22cc2707819a5ef6253a2d59faee2b'
            '15da39f94cf41b50ec1446a59df4d5f1d4057515885ba829000c7192114ee734')
sha256sums_x86_64=('cacaf1906a862347cce1f7987dbe0b8515ae13a4a43e1045acdddbb92f4f6abf')
sha256sums_aarch64=('8c4cecd34a64ae5b1fb672a20571dc7a5a8d6db1f4b71e1de4f3a0978203fb41')

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
