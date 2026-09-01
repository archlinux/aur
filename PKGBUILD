# Maintainer: Jon Tsiros <jon@brightblock.ai>

pkgname=hyprlayer-desktop-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="Native desktop app for spec-driven development with coding agents"
arch=('x86_64')
url="https://brightblock.ai/hyprlayer"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'git' 'xdg-utils' 'hicolor-icon-theme')
optdepends=('claude-code: run Claude Code agent sessions in-app'
            'nodejs: runtime for agent CLIs installed through npm')
provides=('hyprlayer-desktop')
conflicts=('hyprlayer-desktop')
options=('!strip' '!debug' '!emptydirs')
_deb="Hyprlayer_${pkgver}_amd64.deb"
source=("${_deb}::https://github.com/BrightBlock/hyprlayer-releases/releases/download/v${pkgver}/${_deb}")
sha256sums=('cc3d7f69d8e94e3ee9c4bedf06da107a56a52c77098741cc55fb7a37fc70f329')
noextract=("${_deb}")

package() {
  local _unpack="${srcdir}/deb"
  rm -rf "${_unpack}"
  install -d "${_unpack}"
  bsdtar -xf "${srcdir}/${_deb}" -C "${_unpack}"
  bsdtar -xpf "${_unpack}"/data.tar* -C "${pkgdir}"
}
