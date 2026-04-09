# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-mcp
pkgver=0.21.0
pkgrel=1
pkgdesc="MCP server for Chrome DevTools"
arch=('any')
url="https://github.com/ChromeDevTools/chrome-devtools-mcp"
license=('Apache-2.0')
depends=('nodejs')
optdepends=(
  'ffmpeg: experimental screencast support'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha512sums=('77e8aaad199cc294455774380d1085d8b0a8abe582454dc684848a43dbfc83ed42d9487cba98f7bab923c4d3b84088e104c2187a2fd54353902c571e6f2f343a')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${pkgname}/latest" | jq -r '.version'
}

package() {
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -dm755 "${pkgdir}/usr/lib/node_modules"
  cp -a "${srcdir}/package" "${node_root}"
  chmod 755 \
    "${node_root}/build/src/bin/chrome-devtools-mcp.js" \
    "${node_root}/build/src/bin/chrome-devtools.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/node_modules/${pkgname}/build/src/bin/chrome-devtools-mcp.js" "${pkgdir}/usr/bin/chrome-devtools-mcp"
  ln -s "../lib/node_modules/${pkgname}/build/src/bin/chrome-devtools.js" "${pkgdir}/usr/bin/chrome-devtools"

  install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
