# Maintainer: Bora <bora.rs@pm.me>
pkgname=claude-science
pkgver=0.1.43
pkgrel=1
pkgdesc="Run Claude on your data locally, in your browser — Anthropic's research agent (beta)"
arch=('x86_64')
url="https://claude.com/product/claude-science"
license=('LicenseRef-claude-science')
depends=('glibc' 'bash' 'socat' 'bubblewrap>=0.8.0')
optdepends=('xdg-utils: auto-open the web UI in your browser (claude-science serve / open)'
            'ca-certificates: system CA trust store for TLS in restricted environments')
# Self-contained Bun single-file executable with embedded JS/resources — stripping breaks it.
options=('!strip')
# Legal doc is a live page (same one the claude-code AUR package ships): SKIP its checksum.
# The binary is pinned to a version-stable, content-addressed URL with a real checksum.
source=("cs-legal::https://code.claude.com/docs/en/legal-and-compliance.md")
source_x86_64=("claude-science-${pkgver}::https://downloads.claude.ai/claude-science/${pkgver}/linux-x64")
sha256sums=('SKIP')
sha256sums_x86_64=('bd67456d23a70f4ca13c31c910bb4fbb5cf16ecb30919f6bbdeba55bf2e7a528')

package() {
	install -Dm755 "${srcdir}/claude-science-${pkgver}" "${pkgdir}/usr/bin/claude-science"
	install -Dm644 "${srcdir}/cs-legal" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
