# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-mcp
pkgver=1.12.0
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
sha512sums=('9401a91f4cd74f565d68f79f3f528afccbf1c2284e96eed5190ee9e306e10fd3a1375eef502e0a5a4fc8994611f43138b3eeebe2bd32495e31af63a44daed930')

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
