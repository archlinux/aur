# Maintainer: latte

pkgname=hermes-agent-desktop-bin
_pkgname=hermes-desktop
pkgver=0.3.5
pkgrel=1
pkgdesc='Desktop companion for Hermes Agent'
arch=('x86_64')
url='https://github.com/fathah/hermes-desktop'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'hicolor-icon-theme'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'git: install and update a local Hermes Agent from first-run setup'
  'libappindicator-gtk3: tray indicator support'
  'python: run Hermes Agent locally'
  'uv: install and run Hermes Agent locally'
)
provides=('hermes-agent-desktop' 'hermes-desktop')
conflicts=('hermes-agent-desktop' 'hermes-desktop')
options=('!strip')
source=("${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fathah/hermes-desktop/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('85d12b0f8894e7095f904a9a89fcfaea1b0d037cbfb4a12aba81daa87bcdbcd4')
sha256sums_x86_64=('1e3d83a41ed18657e92158d590eb0d9b760dbbb3fce8500b7c0d0be801f3fe0b')

package() {
  bsdtar -xOf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb" data.tar.xz |
    bsdtar -xJf - -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/Hermes Agent/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
