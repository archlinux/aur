# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('archisteamfarm')
pkgver=5.4.7.3
pkgrel=1
pkgdesc="Powerful CLI program primarily for Steam trading card farming based on SteamKit2"
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
source=("${pkgname}-${pkgver}".tar.gz::https://github.com/JustArchiNET/ArchiSteamFarm/archive/refs/tags/${pkgver}.tar.gz
	'archisteamfarm')
b2sums=('c1775e5a5dfebde10354f3218619969831500f85a5becdfe6f28ff230f1522127b4aad346873159441c6cba1333e931064b800090b069b7ae3c75b27ef17dbd9'
	'67a16d35a30213440e7b9ae9ae0b8e75a6f7e8aad8c6d28bcca2f6ca3e32d8c1e6a66c3369c88b7b752107a809687d5314e714230afe2c137b4026b1ab0297fe')
arch=('any')
depends=('dotnet-runtime-7.0')
makedepends=('dotnet-sdk-7.0')
options=('!strip')

build(){
	cd ArchiSteamFarm-"${pkgver}"
	dotnet publish ArchiSteamFarm --configuration 'Release' -f net7.0
}

package(){
	cd ArchiSteamFarm-"${pkgver}"

	# Install launcher
	install -Dm755 "${srcdir}"/archisteamfarm "${pkgdir}"/usr/bin/archisteamfarm

	# Install application
	cd ArchiSteamFarm/bin/Release/net7.0/publish
	find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/lib/${pkgname}"/{}" \;
}
