# Maintainer: latte

pkgname=hermes-agent-desktop-bin
_pkgname=hermes-desktop
pkgver=0.5.1
pkgrel=1
pkgdesc='Desktop companion for Hermes Agent'
arch=('x86_64')
url='https://github.com/fathah/hermes-desktop'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'dbus'
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
sha256sums_x86_64=('11b2d59bbe0437afe64721e49d7e91e6ecbb405e69f97a1eefef636a668a49b1')

package() {
  bsdtar -xOf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb" data.tar.xz |
    bsdtar -xJf - -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/Hermes Agent/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
