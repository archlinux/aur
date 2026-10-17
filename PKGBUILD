# Maintainer: alampy

pkgname=jadx-headless-mcp-bin
pkgver=0.7.1
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
	'6e5eacf500b64292bfb73c49797c1958f6ee44646e43e868039ae7feb573ff75'
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
