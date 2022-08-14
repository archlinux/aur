# Maintainer: demented <dev@snipesharp.xyz>
pkgname=snipesharp
pkgver=1.9.0
pkgrel=1
pkgdesc="Minecraft Name Sniper"
arch=('arm64' 'x86_64')
url="https://github.com/snipesharp/snipesharp"
license=('GPL3')
depends=()
options=("!strip")
makedepends=(dotnet-sdk)
provides=(snipesharp)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "1.9.0.r%s" "$(git rev-list --count HEAD)"
}

package() {
	cd $pkgname/src
	mkdir -p $pkgdir/usr/bin
	dotnet add package DiscordRichPresence
	[ "$CARCH" = "x86_64" ] && dotnet publish -c Release -r linux-x64 -p:PublishSingleFile=true --sc -o $pkgdir/usr/bin
	[ "$CARCH" = "arm64" ] && dotnet publish -c Release -r linux-arm64 -p:PublishSingleFile=true --sc -o $pkgdir/usr/bin
	rm $pkgdir/usr/bin/$pkgname.pdb
}
