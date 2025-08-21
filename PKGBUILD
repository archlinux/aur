# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=roo-code-gemini-cli
_pkgname=roo-code
pkgver=3.25.20
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
sha256sums=('cbf45641f1a55bf5125ff0139446769743a861885e47feebd9a6b71444ea5dd1'
            'aef2dec1546f530508b0918cb3e7235d771f577253efc6f2d1d5d1d9c8bf185b')
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
