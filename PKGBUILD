# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=opencode-rune-bin
pkgver=0.0.0-dev-504 # datasource=github-tags depName=anomalyco/opencode-rune
pkgver=${pkgver//-/_}
pkgrel=1
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

sha256sums_aarch64=('973b27eb1c2c6cd2008f9800479a6076758a0d0e1ecd3f0bbfffd210aba3685d')
sha256sums_x86_64=('c6002e97746b2518562b8291fd70b000ba5a959fbd7cd9f6052c67c6cc2a36ee')

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
