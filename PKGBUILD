# Maintainer: Ryan Hammett <larke12+aur616@linkshideaway.com>
pkgname=twiccian
pkgver=1.0
pkgrel=1
pkgdesc="Twitch streaming client for Linux"
url="https://github.com/Larke12/twiccian"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-webengine' 'qt5-webkit' 'qt5-graphicaleffects' 'mpv' 'rapidjson' 'youtube-dl')
makedepends=('git' 'go')
source=(
	"twiccian::git://github.com/Larke12/twiccian.git"
	"twicciand::git://github.com/Larke12/twicciand.git"
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
	go get "github.com/gorilla/handlers"
	go get "github.com/gorilla/websocket"
	go get "github.com/sorcix/irc"
	go build
}

package() {
	install -Dm755 "$srcdir/twiccian/Twiccian" "$pkgdir/usr/bin/twiccian"
	install -Dm644 "$srcdir/twiccian/main.qml" "$pkgdir/usr/share/twiccian/qml/main.qml"
	install -Dm755 "$srcdir/twicciand/twicciand" "$pkgdir/usr/bin/twicciand"
}
