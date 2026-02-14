# Maintainer: LY <ly-niko@qq.com>

pkgname=jadx-ai-mcp-bin
pkgver=6.1.0
pkgrel=5
pkgdesc="JADX AI MCP plugin JAR and Python MCP bridge server"
arch=('any')
url="https://github.com/zinja-coder/jadx-ai-mcp"
license=('Apache')
depends=('java-runtime>=11' 'python' 'python-fastmcp' 'python-httpx')
optdepends=('jadx: decompiler host application')
install="${pkgname}.install"
source=(
  "jadx-ai-mcp-${pkgver}.jar::https://github.com/zinja-coder/jadx-ai-mcp/releases/download/v${pkgver}/jadx-ai-mcp-${pkgver}.jar"
  "jadx-mcp-server-v${pkgver}.zip::https://github.com/zinja-coder/jadx-ai-mcp/releases/download/v${pkgver}/jadx-mcp-server-v${pkgver}.zip"
  "jadx-ai-mcp-server"
)
noextract=("jadx-ai-mcp-${pkgver}.jar")
sha256sums=(
  'ba3a0f66e1aa253ab85faa5c22625d20936aac90543238c09e633f1970852c41'
  '572b814636eebfe5840c9cc5987e1e8c9f38269a118e9b73cccdd178a574e5ca'
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
