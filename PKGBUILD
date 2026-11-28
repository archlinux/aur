# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=opencode-rune-bin
pkgver=0.0.0-dev-503 # datasource=github-tags depName=anomalyco/opencode-rune
pkgver=${pkgver//-/_}
pkgrel=2
pkgdesc='OpenCode (Rune) desktop client and embeddable Rune session crates'
provides=('opencode-rune')
conflicts=('opencode-rune')
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++.so' 'opencode')
arch=('aarch64' 'x86_64')
url='https://github.com/anomalyco/opencode-rune'
license=('MIT')

_pkgver=${pkgver//_/-}
source_aarch64=("${url}/releases/download/v${_pkgver}/OpenCode-Rune-${_pkgver}-linux-arm64.AppImage")
source_x86_64=("${url}/releases/download/v${_pkgver}/OpenCode-Rune-${_pkgver}-linux-x64.AppImage")

sha256sums_aarch64=('46f9d8c86b47d39e2f2bea647837649703cf4323e03d65215e10c4398f5bcd94')
sha256sums_x86_64=('cbede635e531ce2749193b0288dc90be2c86833d6afd6601985aadf7b4a13fb0')

package() {

	chmod +x *.AppImage
	./*.AppImage --appimage-extract

	cd squashfs-root

	mkdir -p "$pkgdir/usr/share"
	cp -r ./usr/share/* "$pkgdir/usr/share"
	install -Dm755 "usr/bin/opencode-rune" "$pkgdir/usr/bin/opencode-rune"

	rm $pkgdir/usr/share/opencode-rune/{opencode-cli,opencode-cli.version}

	mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
	ln -srf "$pkgdir/usr/share/doc/opencode-rune/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}"
}
