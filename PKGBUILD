# Maintainer: LazyLLM Maintainer <cccc38753@gmail.com>

pkgname=lazy-llm-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Multi-LLM desktop interface built with Electron, React, and TypeScript.'
arch=('x86_64')
url='https://github.com/2725244134/lazy-llm'
license=('custom')
depends=(
  'at-spi2-core'
  'glib2'
  'gtk3'
  'libdrm'
  'libnotify'
  'libxcb'
  'mesa'
  'nss'
  'xdg-utils'
)
optdepends=(
  'alsa-lib: audio playback'
  'trash-cli: move files to trash support'
)
provides=('lazy-llm')
conflicts=('lazy-llm')
options=('!strip')

_debname="lazy-llm_${pkgver}_amd64.deb"
source=("${_debname}::${url}/releases/download/v${pkgver}/${_debname}")
sha256sums=('2d3f5eb2dc853bb7be7b5ae4cd7b878abcf221119369616df840be0a87c4bc9f')
noextract=("${_debname}")

package() {
  cd "${srcdir}"

  ar x "${_debname}" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  install -Dm644 \
    "${pkgdir}/usr/share/doc/lazy-llm/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "${pkgdir}/usr/share/lintian"
}
