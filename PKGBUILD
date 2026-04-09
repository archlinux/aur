# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=gh-axi
pkgver=0.1.11
pkgrel=1
pkgdesc="AXI-compliant GitHub CLI wrapper with token-efficient output and suggestions"
arch=('any')
url="https://github.com/kunchenguid/gh-axi"
license=('MIT')
depends=('nodejs' 'github-cli')
makedepends=('npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha512sums=('6e0e2f57465232fe3e860f40019fb6bc4e75ff75eb6901d328e17e3cb0183e5038121378e3be9a2912576acc1b01f7ff96f21287ca3834aa25904b4eaa3edcbe')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${pkgname}/latest" | jq -r '.version'
}

build() {
  cd "${srcdir}/package"
  npm install --cache "${srcdir}/npm-cache" --omit=dev --ignore-scripts
}

package() {
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -dm755 "${pkgdir}/usr/lib/node_modules"
  cp -a "${srcdir}/package" "${node_root}"
  chmod 755 "${node_root}/dist/bin/gh-axi.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/node_modules/${pkgname}/dist/bin/gh-axi.js" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
