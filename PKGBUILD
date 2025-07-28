# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=roo-code-gemini-cli
_pkgname=roo-code
pkgver=3.24.0
pkgrel=1
pkgdesc="A whole dev team of LLM agents in your VS Code, Cursor or other compatible editor. Patched to add gemini-cli as a LLM provider."
arch=('any')
url="https://github.com/RooCodeInc/Roo-Code"
license=('Apache-2.0')
makedepends=('nodejs' 'npm' 'pnpm')
optdepends=('gemini-cli')
provides=('roo-code')
conflicts=('roo-code')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'roo-code-5223_gemini-cli.diff')
sha256sums=('3ee70335d82407ab10250035b14a503f14d34ed2187271d37e4bd2597277968f'
            '1df0be587921999dfa31010c1112f7f10a36ca6f8018ef3cc8d601047a57cee3')
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
