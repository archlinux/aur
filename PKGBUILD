# Maintainer: Nguyen Pham Cao <natsukagami at gmail dot com>

pkgname=mpd-mpris
pkgver=0.4.0
pkgrel=1
pkgdesc='An implementation of the MPRIS protocol for MPD.'
arch=('any')
url='https://github.com/natsukagami/mpd-mpris'
makedepends=('go>=1.9' 'git')
source=("https://github.com/natsukagami/mpd-mpris/archive/v$pkgver.tar.gz")
sha256sums=('359d5260c2404b875ff40786b74cd29824e3dd0d8a4b15ff1bce204e6e25e498')

build() {
	export GOPATH=${GOPATH=$srcdir}
	cd "$srcdir/$pkgname-$pkgver"
	go build -v -o mpd-mpris cmd/mpd-mpris/*.go
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m 0755 mpd-mpris "$pkgdir/usr/bin/mpd-mpris"
	install -D -m 0644 README.md "$pkgdir/usr/doc/mpd-mpris/README"
	install -D -m 0644 mpd-mpris.service "$pkgdir/usr/lib/systemd/user/mpd-mpris.service"
}
