# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=gh-axi
pkgver=0.1.12
pkgrel=1
pkgdesc="AXI-compliant GitHub CLI wrapper with token-efficient output and suggestions"
arch=('any')
url="https://github.com/kunchenguid/gh-axi"
license=('MIT')
depends=('nodejs' 'github-cli')
makedepends=('npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha512sums=('3971f7927f248f52aac0c76a9fab495659a73e8e5e3bbd9e978c3f72038f7de6c86c21152946b0af36c84e6c40b996f44269133470f51842a5e6170e67c8561e')

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
