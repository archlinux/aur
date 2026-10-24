# Maintainer: alampy

pkgname=jadx-headless-mcp-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Headless MCP server for Android APK static analysis, built on jadx-core'
arch=('any')
url='https://github.com/1013503897/jadx-headless-mcp'
license=('Apache-2.0')
depends=('java-runtime-headless>=17')
provides=('jadx-headless-mcp')
conflicts=('jadx-headless-mcp')
source=(
	"jadx-headless-mcp-${pkgver}-all.jar::${url}/releases/download/v${pkgver}/jadx-headless-mcp-${pkgver}-all.jar"
	"LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=(
	'4b9a01c23845c123c217840182d2b5f2c26a7ca20dec3d08810b310fc80a2372'
	'612097054771e7268f449b9d479bd47e7ef0901961d1515804e03f1d84e1920d'
)

package() {
	local jar="jadx-headless-mcp-${pkgver}-all.jar"

	install -Dm644 "$srcdir/$jar" \
		"$pkgdir/usr/share/java/jadx-headless-mcp/$jar"
	install -Dm644 "$srcdir/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -d "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/jadx-headless-mcp" <<-EOF
		#!/bin/sh
		exec /usr/bin/java -jar /usr/share/java/jadx-headless-mcp/$jar "\$@"
	EOF
	chmod 755 "$pkgdir/usr/bin/jadx-headless-mcp"
}
