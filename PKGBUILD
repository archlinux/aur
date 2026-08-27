# Maintainer: Jon Tsiros <jon@brightblock.ai>

pkgname=hyprlayer-desktop-bin
pkgver=0.7.2
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
sha256sums=('80aa0684708a0946d9a42ee3a4aaaf372a4c57a0579e142930e60e0d1f15db7d')
noextract=("${_deb}")

package() {
  local _unpack="${srcdir}/deb"
  rm -rf "${_unpack}"
  install -d "${_unpack}"
  bsdtar -xf "${srcdir}/${_deb}" -C "${_unpack}"
  bsdtar -xpf "${_unpack}"/data.tar* -C "${pkgdir}"
}
