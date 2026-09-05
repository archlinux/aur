# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-subagents
pkgver=0.65.1
pkgrel=1
pkgdesc='Subagents extension for pi coding agent'
arch=('any')
makedepends=('npm')
url='https://github.com/nicobailon/pi-subagents'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-subagents/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('c39a7e598a5f7ffdb89a9e9653c0937a0ed074eb1390879f075f853b79b3165b')
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
