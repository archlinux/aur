# Maintainer: James Groom <OSSYoshiRulz at gmail dot com>
pkgname=bizhawk-monort
_providesName=bizhawk
pkgver=2.6.2
_archiveName="BizHawk-$pkgver-linux-x64.tar.zip"
pkgrel=1
pkgdesc="A multi-system emulator on .NET. Features rerecording and tools for TASing. (Mono runtime)"
arch=("x86_64")
url="https://gitlab.com/TASVideos/BizHawk#readme"
license=("MIT" "custom")
depends=("glibc" "lsb-release" "mono>=6.12" "openal")
optdepends=(
	"antimicro: to use unsupported controllers (by mapping to the keyboard)"
)
#makedepends=("dotnet-sdk>=5.0.0")
provides=("$_providesName=$pkgver")
install="bizhawk-monort.install"
source=("https://github.com/TASVideos/BizHawk/releases/download/$pkgver/$_archiveName")
sha512sums=("8751a2229d9e500a3f3a283ce24ae62f8f911507f5fdbe25aa41f31ac5026cf89433c89dc766864439a17531543829e4b43bc4d3b311f5a80b4df0605bbd9627")

package() {
	cd "$srcdir"
	mkdir opt
	tar -xf BizHawk*.tar -C opt
	cd opt
	find . -type d                 -exec install -D -ggames -m775 -d "$pkgdir/opt/$_providesName/{}" \;
	find . -type f -not -name *.sh -exec install -D -ggames -m664 "{}" "$pkgdir/opt/$_providesName/{}" \;
	find . -type f      -name *.sh -exec install -D -ggames -m774 "{}" "$pkgdir/opt/$_providesName/{}" \;
}
