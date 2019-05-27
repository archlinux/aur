# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>
# Maintainer: MOTT <ted.jameson at pm dot me>
pkgname=telephant-git
pkgver=20190525
pkgrel=1
epoch=
pkgdesc="A lightweight but modern Mastodon client, written in Go & QML"
arch=('x86_64')
url="https://github.com/muesli/telephant"
license=('MIT')
groups=()
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2')
makedepends=('go' 'pkgconf' 'qt5-tools' 'git' 'libpulse' 'glib2' 'mesa')
checkdepends=()
optdepends=()
provides=("telephant")
conflicts=("telephant")
replaces=()
backup=()
options=()
install=
noextract=()
#source=($pkgname::git://github.com/muesli/telephant.git)
#md5sums=("SKIP")

build() {
	export GOPATH="$srcdir"/gopath
	export QT_PKG_CONFIG=true
	export QT_DIR=/usr

	# Qt Bindings
	go get -u -v -tags=no_env github.com/therecipe/qt/cmd/...

	# Building Telephant
	go get -d -v github.com/muesli/telephant
	cd gopath/src/github.com/muesli/telephant
	$(go env GOPATH)/bin/qtdeploy build desktop .
}


package() {
	install -Dm755 "gopath/src/github.com/muesli/telephant/deploy/linux/telephant" "$pkgdir/usr/bin/telephant"
}
