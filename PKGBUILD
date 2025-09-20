# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=roo-code-gemini-cli
_pkgname=roo-code
pkgver=3.28.4
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
sha256sums=('6d50d9e3209fcb1eda25dd1c193dd0286bc7b3b0a7d4be51237256df22f7f092'
            '16ec51a00472476146443293b9c480d98c6c47ead09ccc524c3dfd16da9680a2')
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
