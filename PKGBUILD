# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=roo-code-gemini-cli
_pkgname=roo-code
pkgver=3.25.16
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
sha256sums=('87cf126233b5479f7494631c3c0896877e11f7acba284cde1c64ae75018d1537'
            '81e2cd2183374d5e0f0d450e804703d5acd3237187f21b1ee905fd30b195c5fa')
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
