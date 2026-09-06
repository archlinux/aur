# Maintainer: Avenge Media LLC <avengemediallc at gmail dot com>
_pkgauthor=AvengeMedia
_repo=dank-greeter
_binname=dms-greeter

pkgname=greetd-dms-greeter-bin
pkgver=1.6.0
pkgrel=3
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
  "dms-hypr-${pkgver}.conf::${_urlraw}/assets/examples/dms-hypr.conf"
  "dms-hypr-${pkgver}.lua::${_urlraw}/assets/examples/dms-hypr.lua"
  "${_binname}-completions-${pkgver}.tar.gz::${_urlrel}/${_binname}-completions-${pkgver}.tar.gz"
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[1]}.gz")

sha256sums=('0c4c01a73eb7d2d1286a7e60e580dd53b605636dc46a57c9c3318e8e23efc676'
            '5fe761315fa5d4497b2342a3e30f625be964efe002347a32d415d59de88f0f96'
            '3dc267a18f22d06f595a80fb77275db56fe88c48b838db364ba3a1d307572a50'
            '0376981f71a7331e3a8e5fdf71628f8c0e3881328969011f31fc1da6d54036c0'
            'ae9e76c0a4af1390866e427de2eac9c9339115008790c06a6605022b0b82b89f'
            '1262f1c8d5e3a19c05d0e5863c54181c7f2c9fe404d69b7ef0629e2c758ffc16'
            '984821e4e39552a94ab8ee5e2e44becc83658281e95f7b494d5ff1995d2afc24')
sha256sums_x86_64=('950e8a3eefaef57a54cc6f12108438ad447a4de3da67ded2b809877727c2ef83')
sha256sums_aarch64=('b11e3417bd0548bcf5cd74075c01281179264ec3faf4596503b35d9d26f5dca9')

package() {
  cd "${srcdir}" || exit 1

  install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"

  install -Dm644 "${_binname}"      "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "_${_binname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"

  install -Dm644 "tmpfiles-${_binname}-${pkgver}.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_binname}.conf"

  install -Dm644 "dms-niri-${pkgver}.kdl"  "${pkgdir}/usr/share/doc/${pkgname}/examples/dms-niri.kdl"
  install -Dm644 "dms-hypr-${pkgver}.conf" "${pkgdir}/usr/share/doc/${pkgname}/examples/dms-hypr.conf"
  install -Dm644 "dms-hypr-${pkgver}.lua"  "${pkgdir}/usr/share/doc/${pkgname}/examples/dms-hypr.lua"

  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
