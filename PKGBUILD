# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('archisteamfarm')
pkgver=5.4.2.13
pkgrel=1
pkgdesc="Powerful CLI program primarily for Steam trading card farming based on SteamKit2"
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
source=("${pkgname}-${pkgver}".tar.gz::https://github.com/JustArchiNET/ArchiSteamFarm/archive/refs/tags/${pkgver}.tar.gz
	'archisteamfarm')
b2sums=('5f4c79885b87d13c9cf7e1b32d603df76fff3c3a1c4a3ee4d7f2275f1a740f3343837fff455e5342806c19a553213e68617ad9a87e253ce7e87f68c072721470'
	'67a16d35a30213440e7b9ae9ae0b8e75a6f7e8aad8c6d28bcca2f6ca3e32d8c1e6a66c3369c88b7b752107a809687d5314e714230afe2c137b4026b1ab0297fe')
arch=('any')
depends=('dotnet-runtime-7.0')
makedepends=('dotnet-sdk-7.0')
options=('!strip')

build(){
	cd ArchiSteamFarm-"${pkgver}"
	dotnet publish ArchiSteamFarm --configuration 'Release'
}

package(){
	cd ArchiSteamFarm-"${pkgver}"

	# Install launcher
	install -Dm755 "${srcdir}"/archisteamfarm "${pkgdir}"/usr/bin/archisteamfarm

	# Install application
	cd ArchiSteamFarm/bin/Release/net7.0/publish
	find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/lib/${pkgname}"/{}" \;
}
