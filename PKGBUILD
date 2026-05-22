# Maintainer: Julian Raufelder <aur@raufelder.com>

pkgname=mobile-mcp
_npmname='@mobilenext/mobile-mcp'
pkgver=0.0.55
pkgrel=1
pkgdesc='Model Context Protocol (MCP) server for automating native iOS and Android apps and devices'
arch=('x86_64' 'aarch64')
url='https://github.com/mobile-next/mobile-mcp'
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
optdepends=('android-tools: adb-based control of Android devices and emulators'
            'go-ios: iOS device control')
options=('!strip' '!emptydirs')
source=("https://registry.npmjs.org/${_npmname}/-/mobile-mcp-${pkgver}.tgz")
noextract=("mobile-mcp-${pkgver}.tgz")
sha256sums=('902890d6f638eb9f04d09c3ec83a18f44c355c7b759211d87b83808e93d2da78')

package() {
	npm install -g \
		--prefix "${pkgdir}/usr" \
		--cache "${srcdir}/npm-cache" \
		--ignore-scripts \
		"${srcdir}/mobile-mcp-${pkgver}.tgz"

	find "${pkgdir}" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	rm -f "${pkgdir}/usr/lib/node_modules/.package-lock.json"

	install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
