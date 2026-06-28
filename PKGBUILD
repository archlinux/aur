# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=gh-axi
pkgver=0.1.24
pkgrel=1
pkgdesc="AXI-compliant GitHub CLI wrapper with token-efficient output and suggestions"
arch=('any')
url="https://github.com/kunchenguid/gh-axi"
license=('MIT')
depends=('nodejs' 'github-cli')
makedepends=('npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha512sums=('e4a620b43c49f2ddbca0ef2c5ea3b5b6af1d25efb09905f6a3ebe65941e3d62f38ba8eef113b2798ef7e5bd277f163f363d05997a5b7ce739b96274ed393bb60')

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
