# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=llm-thalamus
_pkgname=llm_thalamus
pkgver=0.12
pkgrel=1
pkgdesc="Local AI controller and PySide6 UI integrating OpenMemory with Ollama"
arch=('any')
url="https://github.com/evertvorster/llm_thalamus"
license=('GPL-3.0-or-later')
depends=(
  'ollama'
  'python'
  'pyside6'               # Qt6 Python bindings (includes WebEngine bindings) :contentReference[oaicite:0]{index=0}
  'python-markdown-it-py' # markdown-it-py parser
  'python-requests'
  'python-openmemory'  # your OpenMemory wrapper package (AUR)
  'katex'                 # provides /usr/lib/node_modules/katex/dist assets :contentReference[oaicite:1]{index=1}
  'qt6-webengine'         # underlying Qt WebEngine libs :contentReference[oaicite:2]{index=2}
  'highlightjs'           # Javascript highlighting
  'llm-thalamus-theme'    # Meta-mackage that installs a theme.
)
makedepends=('python')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/evertvorster/llm_thalamus/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('01a5ab1d8445d9677f307db49178c87971afeeb29dbebec66486c5966137d444')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Pure Python, nothing to build
}

package() {
  pkgdesc="Core llm-thalamus daemon and UI"
  depends=('python' 'qt6-base' 'qt6-webengine' 'llm-thalamus-theme')

  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Use the project Makefile to install everything
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

