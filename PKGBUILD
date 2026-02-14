# Maintainer: LazyLLM Maintainer <cccc38753@gmail.com>

pkgname=lazy-llm-bin
pkgver=0.1.3
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
sha256sums=('2793e1aaa24a769009e851d803f75d45483672e7a3045b74055cbf08d2ce29d2')
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
