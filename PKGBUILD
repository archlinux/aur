# Maintainer: Nguyen Pham Cao <natsukagami at gmail dot com>

_gopkgname='github.com/natsukagami/mpd-mpris'

pkgname=mpd-mpris
pkgver=0.2.1
pkgrel=1
pkgdesc='An implementation of the MPRIS protocol for MPD.'
arch=('any')
url='https://github.com/natsukagami/mpd-mpris'
makedepends=('go>=1.9' 'git')
source=("https://github.com/natsukagami/mpd-mpris/archive/v$pkgver.tar.gz")
sha256sums=('d4eb193e0a98f584aed5603170ea226f2bf996769f995138ab5d2a9850c67cdb')

prepare() {
    export GOPATH="$srcdir/build"
    rm -rf "$GOPATH/src/$_gopkgname"
    mkdir --parents `dirname "$GOPATH/src/$_gopkgname"`
    mv -Tv "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$_gopkgname"
		cp "$GOPATH/src/$_gopkgname/mpd-mpris.service" "$srcdir"
}

build() {
	export GOPATH="$srcdir/build"
	go build -v -o $srcdir/mpd-mpris $_gopkgname/cmd/mpd-mpris
}

package() {
	install -D -m 0755 mpd-mpris "$pkgdir/usr/bin/mpd-mpris"
	install -D -m 0644 mpd-mpris.service "$pkgdir/usr/lib/systemd/user/mpd-mpris.service"
}