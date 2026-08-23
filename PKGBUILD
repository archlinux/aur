# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-web-access
pkgver=0.24.2
pkgrel=1
pkgdesc='Web search, URL fetching, and content extraction extension for pi coding agent'
arch=('any')
makedepends=('npm')
url='https://github.com/nicobailon/pi-web-access'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-web-access/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('329d1a71e31e0645760e97c36cd924e56b1fa16f85d412e29072a3809575d922')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')
options=('!strip' '!debug')

build() {
  cd "${srcdir}/pi-web-access-${pkgver}"
  npm install --omit=dev --no-audit --no-fund
  # Strip npm metadata and test directories from vendored deps
  rm -f node_modules/.package-lock.json
  find node_modules -name test -type d -prune -exec rm -rf {} + 2>/dev/null || true
}

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/web-access"
  cp -a "${srcdir}/pi-web-access-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/web-access/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/web-access/test"

  install -Dm644 "${srcdir}/pi-web-access-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
