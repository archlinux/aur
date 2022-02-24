# Maintainer: James Groom <OSSYoshiRulz at gmail dot com>
pkgname=bizhawk-monort
_providesName=bizhawk
pkgver=2.8
_archiveName="BizHawk-$pkgver-linux-x64.tar.gz"
pkgrel=1
pkgdesc="A multi-system emulator on .NET. Features rerecording and tools for TASing. (Mono runtime)"
arch=("x86_64")
url="https://gitlab.com/TASVideos/BizHawk#readme"
license=("MIT" "custom")
depends=("glibc" "lsb-release" "mono>=6.12" "openal")
optdepends=(
	"antimicro: to use unsupported controllers (by mapping to the keyboard)"
)
#makedepends=("dotnet-sdk>=6.0.0")
provides=("$_providesName=$pkgver")
install="bizhawk-monort.install"
source=("https://github.com/TASVideos/BizHawk/releases/download/$pkgver/$_archiveName")
sha512sums=("a9ffbcd914ca1843372f50de7c022107e65b8ded3bc61f04d584a7c5342ad83321a22b9f066a8872431181bcc8de605827911b0c67511c5a2d4e75910c85d1a6")

package() {
	cd "$srcdir"
	mkdir opt
	tar -xf BizHawk*.tar.gz -C opt
	cd opt
	find . -type d                 -exec install -D -ggames -m775 -d "$pkgdir/opt/$_providesName/{}" \;
	find . -type f -not -name *.sh -exec install -D -ggames -m664 "{}" "$pkgdir/opt/$_providesName/{}" \;
	find . -type f      -name *.sh -exec install -D -ggames -m774 "{}" "$pkgdir/opt/$_providesName/{}" \;
}
