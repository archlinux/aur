# Maintainer: aksr <aksr at t-com dot me>
pkgname=9front-drawterm-hg
pkgrel=1
pkgver=402.1d3e2b3502f1
pkgdesc="A fork of drawterm to incorporate features from 9front, most importantly DP9IK authentication support and the TLS based rcpu protocol."
arch=('i686' 'x86_64')
url="http://drawterm.9front.org/"
license=('custom: LPC, MIT')
depends=('xorg-server')
makedepends=('mercurial')
source=("$pkgname::hg+https://code.9front.org/hg/drawterm")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	echo $(hg identify -n).$(hg identify -i)
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
