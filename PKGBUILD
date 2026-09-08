# Maintainer: LY <ly-niko@qq.com>

pkgname=jadx-ai-mcp-bin
pkgver=6.4.1
pkgrel=1
pkgdesc="JADX AI MCP plugin JAR and Python MCP bridge server"
arch=('any')
url="https://github.com/zinja-coder/jadx-ai-mcp"
license=('Apache')
depends=('java-runtime>=11' 'python' 'python-fastmcp' 'python-httpx')
optdepends=('jadx: decompiler host application')
install="${pkgname}.install"
source=(
  "jadx-ai-mcp-${pkgver}.jar::https://github.com/zinja-coder/jadx-ai-mcp/releases/download/V${pkgver}/jadx-ai-mcp-${pkgver}.jar"
  "jadx-mcp-server-${pkgver}.zip::https://github.com/zinja-coder/jadx-ai-mcp/releases/download/V${pkgver}/jadx-mcp-server-${pkgver}.zip"
  "jadx-ai-mcp-server"
)
noextract=("jadx-ai-mcp-${pkgver}.jar")
sha256sums=(
  'df7040ee4bc724c132635e8ad906b0961829db09a35da3365cbc46a761bed983'
  'e7cf0fa756b817cde3d3a2b6c04a6a6eb8546298eaff6a957e711fb68e53b532'
  'f4591632a93ec802fd0d03c3d61e25d87877127420d128a156915f3a8210ab69'
)

package() {
  install -Dm644 "${srcdir}/jadx-ai-mcp-${pkgver}.jar" "${pkgdir}/usr/share/jadx-ai-mcp/jadx-ai-mcp.jar"

  install -d "${pkgdir}/usr/share/jadx-ai-mcp/jadx-mcp-server"
  cp -a "${srcdir}/jadx-mcp-server/." "${pkgdir}/usr/share/jadx-ai-mcp/jadx-mcp-server/"
  install -Dm644 /dev/null "${pkgdir}/usr/share/jadx-ai-mcp/jadx-mcp-server/src/__init__.py"
  chmod 755 "${pkgdir}/usr/share/jadx-ai-mcp/jadx-mcp-server/jadx_mcp_server.py"

  install -Dm755 "${srcdir}/jadx-ai-mcp-server" "${pkgdir}/usr/bin/jadx-ai-mcp-server"

  install -Dm644 "${srcdir}/jadx-mcp-server/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
