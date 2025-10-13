# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=roo-code-gemini-cli
_pkgname=roo-code
pkgver=3.28.16
pkgrel=1
pkgdesc="A whole dev team of LLM agents in your VS Code, Cursor or other compatible editor. Patched to add gemini-cli as a LLM provider."
arch=('any')
url="https://github.com/RooCodeInc/Roo-Code"
license=('Apache-2.0')
makedepends=('nodejs' 'npm' 'pnpm')
optdepends=('gemini-cli' 'qwen-code')
provides=('roo-code')
conflicts=('roo-code')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'roo-code-5223_gemini-cli.diff')
sha256sums=('ab127c0ccf297d849f6b03c3450771f4ed6fd069300a29871fd7349ddcbb1d53'
            '03b9baa591e70f004f2c283a01eac4589334d1585e80e7eac5d3b240220c5b3c')
install=${_pkgname}.install

prepare() {
  cd "Roo-Code-${pkgver}"
  # https://github.com/RooCodeInc/Roo-Code/pull/5223/files reverted
  patch -p1 -i ../roo-code-5223_gemini-cli.diff
}

build() {
  cd "Roo-Code-$pkgver"
  pnpm install
  pnpm vsix
}

package() {
  install -Dm644 "Roo-Code-${pkgver}/bin/roo-cline-${pkgver}.vsix" "${pkgdir}/usr/share/${_pkgname}/roo-cline-$pkgver.vsix"
}
