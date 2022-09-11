# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('archisteamfarm')
pkgver=5.3.0.3
pkgrel=2
pkgdesc="Powerful CLI program primarily for Steam trading card farming based on SteamKit2"
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
source=("${pkgname}-${pkgver}".tar.gz::https://github.com/JustArchiNET/ArchiSteamFarm/archive/refs/tags/${pkgver}.tar.gz
	'archisteamfarm')
b2sums=('7c1a099e647e29b443367b7404121d34a058492234eb16039de18e2cc7a875e5045abb796b76ad8c29f0b6c8921544503393735269277b102ac6b1038df2c0fc'
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
