# Maintainer: Manuel Schneider <kontakt at brainyxs dot com>
pkgname=twitchleecher-dx
_pkgname=TwitchLeecher-Dx
pkgdesc="A simple download tool for Twitch streams"
pkgver=3.6.1
_pkgver=3.6.1
pkgrel=1
arch=('x86_64')
url='https://github.com/schneidermanuel/TwitchLeecher-Dx'
license=("MIT")
depends=("icu" "ffmpeg")
makedepends=("dotnet-sdk")
options=("staticlibs")
source=("$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('9cde6b4a31a3894ceed114aa0eb1445ab322fb8037499d03c9790bd1393bd665')

build() {
	cd "$_pkgname-$_pkgver/TwitchLeecher/TwitchLeecher"
	MSBUILDDISABLENODEREUSE=1 dotnet publish \
		--configuration Release \
		--self-contained true \
		--runtime linux-x64 \
		-p:PublishTrimmed=true \
		--output ../../$pkgname \
		./TwitchLeecher.csproj
}

package() {
	cd "$_pkgname-$_pkgver"

	install -d $pkgdir/usr/{bin,lib}
	install -d $pkgdir/usr/share/{pixmaps,applications}
	cp -r $pkgname "$pkgdir/usr/lib/"
	ln -s "/usr/lib/$pkgname/TwitchLeecher" "$pkgdir/usr/bin/$pkgname"
	cp TwitchLeecher/Resources/Images/TL_Icon.png "$pkgdir/usr/share/pixmaps/twitchleecher-dx.png"
	cp twitchleecher-dx.desktop "$pkgdir/usr/share/applications/twitchleecher-dx.desktop"
}
