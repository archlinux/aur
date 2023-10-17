# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: James Groom <OSSYoshiRulz at gmail dot com>
pkgname=bizhawk-monort
_providesName=bizhawk
pkgver=2.9.1
_archiveName="BizHawk-$pkgver-linux-x64.tar.gz"
pkgrel=2
pkgdesc="A multi-system emulator on .NET. Features rerecording and tools for TASing. (Mono runtime)"
arch=("x86_64")
url="https://gitlab.com/TASVideos/BizHawk#readme"
license=("MIT" "custom")
depends=("glibc" "lsb-release" "lua" "mono>=6.12" "openal")
optdepends=(
	"antimicro: to use unsupported controllers (by mapping to the keyboard)"
)
provides=("$_providesName=$pkgver")
install="bizhawk-monort.install"
source=("https://github.com/TASVideos/BizHawk/releases/download/$pkgver/$_archiveName")
sha512sums=("bec7e558963416b3749ef558bc682d1a874a43df8fe3083224ec7c4c0326cdfea662ef5c604eea7c1743d2eeb13656ccf749f0cdb3a413f4985c4b305a95e742")

package() {
	cd "$srcdir"
	mkdir opt
	tar -xf BizHawk*.tar.gz -C opt
	cd opt
	find . -type d                 -exec install -D -ggames -m775 -d "$pkgdir/opt/$_providesName/{}" \;
	find . -type f -not -name *.sh -exec install -D -ggames -m664 "{}" "$pkgdir/opt/$_providesName/{}" \;
	find . -type f      -name *.sh -exec install -D -ggames -m774 "{}" "$pkgdir/opt/$_providesName/{}" \;
}
