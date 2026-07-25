# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-subagents
pkgver=0.36.0
pkgrel=1
pkgdesc='Subagents extension for pi coding agent'
arch=('any')
makedepends=('npm')
url='https://github.com/nicobailon/pi-subagents'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-subagents/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('46590898b202ffbf10dd789551a713fa62fd1190207ca430a7a45fc60875a0c2')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')
options=('!strip' '!debug')

build() {
  cd "${srcdir}/pi-subagents-${pkgver}"
  npm install --omit=dev --no-audit --no-fund
  # Strip npm metadata bloat from vendored deps
  rm -f node_modules/.package-lock.json
}

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/subagents"
  cp -a "${srcdir}/pi-subagents-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/subagents/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/subagents/test"
}
