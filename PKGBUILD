# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=twiccian
pkgver=0.01
pkgrel=1
pkgdesc="Twitch streaming client for Linux"
url="https://github.com/octotep/twiccian"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('mpv' 'youtube-dl' 'qt5-base' 'qt5-webengine' 'qt5-webkit' 'qt5-quickcontrols' 'rapidjson')
makedepends=('git' 'go')
source=(
	"twiccian::git://github.com/octotep/twiccian.git"
	"twicciand::git://github.com/octotep/twicciand.git"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

build() {
	cd twiccian/
	qmake Twiccian.pro
	make
	
	cd ../twicciand/
	export GOPATH=$PWD
	go get "github.com/walle/cfg"
	go get "github.com/gorilla/websocket"
	go get "github.com/sorcix/irc"
	go build
}

package() {
	install -Dm755 "$srcdir/twiccian/Twiccian" "$pkgdir/usr/bin/twiccian"
	install -Dm644 "$srcdir/twiccian/main.qml" "$pkgdir/usr/share/twiccian/qml/main.qml"
	install -Dm755 "$srcdir/twicciand/twicciand" "$pkgdir/usr/bin/twicciand"
}
