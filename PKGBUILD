# Maintainer: neo64yt <neo64yt-official at protonmail dot org>
pkgname=9front-drawterm-git
pkgrel=1
pkgver=r488.60e52ed
pkgdesc="A fork of drawterm to incorporate features from 9front, most importantly DP9IK authentication support and the TLS based rcpu protocol."
arch=('i686' 'x86_64')
url="http://drawterm.9front.org/"
license=('custom: LPC, MIT')
depends=('xorg-server')
makedepends=('git')
conflicts=('9front-drawterm-hg')
source=("$pkgname::git+git://git.9front.org/plan9front/drawterm")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	CONF=unix make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 drawterm $pkgdir/usr/bin/9front-drawterm
	install -Dm644 drawterm.1 $pkgdir/usr/share/man/man1/9front-drawterm.1
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
