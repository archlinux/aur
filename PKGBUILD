# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-mcp
pkgver=0.24.0
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
sha512sums=('78ded8647d39a536028e03e3feb4f4bea62384ec06aea657df02bb23cb2e96344c677d0bf183e5aff32ac9848339fedf7b7b3d1b413b4aa48d5f6c57a2fe993f')

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
