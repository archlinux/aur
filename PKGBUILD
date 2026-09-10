# Maintainer: Avenge Media LLC <avengemediallc at gmail dot com>
_pkgauthor=AvengeMedia
_repo=dank-greeter
_binname=dms-greeter

pkgname=greetd-dms-greeter-bin
pkgver=1.6.2
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
  "dms-hypr-${pkgver}.conf::${_urlraw}/assets/examples/dms-hypr.conf"
  "dms-hypr-${pkgver}.lua::${_urlraw}/assets/examples/dms-hypr.lua"
  "${_binname}-completions-${pkgver}.tar.gz::${_urlrel}/${_binname}-completions-${pkgver}.tar.gz"
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[1]}.gz")

sha256sums=('0c4c01a73eb7d2d1286a7e60e580dd53b605636dc46a57c9c3318e8e23efc676'
            '21d460b29318eee3d2135eb431fd041a263ae7589e2de6b58e1bc66f771ec9ee'
            '3dc267a18f22d06f595a80fb77275db56fe88c48b838db364ba3a1d307572a50'
            '0376981f71a7331e3a8e5fdf71628f8c0e3881328969011f31fc1da6d54036c0'
            'ae9e76c0a4af1390866e427de2eac9c9339115008790c06a6605022b0b82b89f'
            '1262f1c8d5e3a19c05d0e5863c54181c7f2c9fe404d69b7ef0629e2c758ffc16'
            'cc652f67d2c404a8bf987c7e624293c66d5aadcd2e8e18a784f12b0d1f2c8c61')
sha256sums_x86_64=('74c2200f98c6e75ba92088c7e30dfea2b32758b6e5888f996a7e9a9688539a4d')
sha256sums_aarch64=('29b6c010360d4df09e4dadf0224c0c6d43a52a9aa1bed74bb2184d6172f407e9')

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
