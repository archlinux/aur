# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('archisteamfarm')
pkgver=5.3.1.2
pkgrel=1
pkgdesc="Powerful CLI program primarily for Steam trading card farming based on SteamKit2"
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
source=("${pkgname}-${pkgver}".tar.gz::https://github.com/JustArchiNET/ArchiSteamFarm/archive/refs/tags/${pkgver}.tar.gz
	'archisteamfarm')
b2sums=('e4cf547298bbeb55cea895009474dbeb8b8f723121a9c15619917009223b37da85ae6998aac2884b82bd7d44df0d801f7d1bf5b02f2b34c2ea45e3b05c1eff3f'
	'67a16d35a30213440e7b9ae9ae0b8e75a6f7e8aad8c6d28bcca2f6ca3e32d8c1e6a66c3369c88b7b752107a809687d5314e714230afe2c137b4026b1ab0297fe')
arch=('any')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
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
	cd ArchiSteamFarm/bin/Release/net6.0/publish
	find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/lib/${pkgname}"/{}" \;
}
