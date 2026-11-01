# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=gh-axi
pkgver=0.1.47
pkgrel=1
pkgdesc="AXI-compliant GitHub CLI wrapper with token-efficient output and suggestions"
arch=('any')
url="https://github.com/kunchenguid/gh-axi"
license=('MIT')
depends=('nodejs' 'github-cli')
makedepends=('npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha512sums=('16a6244f95fd6a4c474ed1f6649186777f2950e9839f7741baa0cd0d9be0b54b9ce4067358974cbc75e71ccad306591a2d600a2527f8212ee6c978d8028d291b')

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
