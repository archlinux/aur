# Maintainer: James Groom <OSSYoshiRulz at gmail dot com>
pkgname=bizhawk-monort
_providesName=bizhawk
pkgver=2.5.2
_archiveName="BizHawk-2.5.2"
pkgrel=1
pkgdesc="A multi-system emulator on .NET. Features rerecording and tools for TASing. (Mono runtime)"
arch=("x86_64")
url="https://gitlab.com/TASVideos/BizHawk#readme"
license=("MIT" "custom")
depends=("glibc" "lsb-release" "mono>=6.10" "openal")
optdepends=(
	"antimicro: to use unsupported controllers as keyboards"
	"ffmpeg: to use built-in A/V capture, unstable"
)
makedepends=("dotnet-sdk>=5.0.0")
provides=("$_providesName=$pkgver")
source=("https://github.com/TASVideos/BizHawk/releases/download/$pkgver/$_archiveName.zip")
sha512sums=("9e4cdf5e2e311ca5ad5750b91ea5163d8e727813f9a88200d80013657c45b33b0a51112fd5816debe264b99b1244b8555c0f8b9eccfc6f87c45e67bbd1c28b06")

package() {
	cd "$srcdir"
	find . -type d                 -exec install -D -ggames -m775 -d "$pkgdir/opt/$_providesName/{}" \;
	find . -type f -not -name *.sh -exec install -D -ggames -m664 "{}" "$pkgdir/opt/$_providesName/{}" \;
	find . -type f      -name *.sh -exec install -D -ggames -m774 "{}" "$pkgdir/opt/$_providesName/{}" \;
}
