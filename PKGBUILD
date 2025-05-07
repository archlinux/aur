# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=DepotDownloader
pkgname=steamdepotdownloader
pkgver=3.3.0
pkgrel=1
pkgdesc="Steam depot downloader utilizing the SteamKit2 library."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/SteamRE/DepotDownloader"
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'zlib' 'dotnet-runtime')
makedepends=('dotnet-sdk') #Dotnet 9
source=("$url/archive/refs/tags/DepotDownloader_${pkgver}.tar.gz")
sha256sums=('f4d52a79f0294d3561261c922840df57bde08ce29bfb255cc562eac4014d7beb')
options=('!strip')
validpgpkeys=()

build() {
	cd "$_pkgname-${_pkgname}_$pkgver"
	case $CARCH in
		x86_64)
		dotnet publish -r linux-x64 -p:PublishSingleFile=true --no-self-contained
		;;
		armv7h)
		dotnet publish -r linux-arm -p:PublishSingleFile=true --no-self-contained
		;;
		aarch64)
		dotnet publish -r linux-arm64 -p:PublishSingleFile=true --no-self-contained
		;;
	esac
}

package() {
	case $CARCH in
		x86_64)
		install -Dm755 "$srcdir/$_pkgname-${_pkgname}_$pkgver/${_pkgname}/bin/Release/net9.0/linux-x64/publish/${_pkgname}" "$pkgdir/usr/bin/depotdownloader"
		;;
		armv7h)
		install -Dm755 "$srcdir/$_pkgname-${_pkgname}_$pkgver/${_pkgname}/bin/Release/net9.0/linux-arm/publish/${_pkgname}" "$pkgdir/usr/bin/depotdownloader"
		;;
		aarch64)
		install -Dm755 "$srcdir/$_pkgname-${_pkgname}_$pkgver/${_pkgname}/bin/Release/net9.0/linux-arm/publish/${_pkgname}" "$pkgdir/usr/bin/depotdownloader"
		;;
	esac
	install -Dm644 "$srcdir/$_pkgname-${_pkgname}_$pkgver/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
