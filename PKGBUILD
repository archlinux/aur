# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-mcp
pkgver=1.5.0
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
sha512sums=('61fa5e83a70a9d6685aeafc2a53635f5b54ed24afce02a473604d24174d0b21a2f29c4487f579f875bc023e20eb825eb42faee976844d17a0a3e7f782d1c42d4')

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
