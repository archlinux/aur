# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=DepotDownloader
pkgname=steamdepotdownloader
pkgver=2.7.4
pkgrel=1
pkgdesc="Steam depot downloader utilizing the SteamKit2 library."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/SteamRE/DepotDownloader"
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('dotnet-sdk-bin') #Dotnet 9
source=("$url/archive/refs/tags/DepotDownloader_${pkgver}.tar.gz")
sha256sums=('abc4ccb04f720d12b8907efff8ae3d1232b1ad28bcb7a7a3beba8a859f7a2055')
options=('!strip')
validpgpkeys=()

build() {
	cd "$_pkgname-${_pkgname}_$pkgver"
	case $CARCH in
		x86_64)
		dotnet publish -r linux-x64 -p:PublishSingleFile=true --self-contained
		;;
		armv7h)
		dotnet publish -r linux-arm -p:PublishSingleFile=true --self-contained
		;;
		aarch64)
		dotnet publish -r linux-arm64 -p:PublishSingleFile=true --self-contained
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
}
