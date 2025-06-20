# Maintainer: Gustavo Rehermann
# Based on package by: Cookie Engineer <@cookiengineer>

pkgname=ferroxide-git
pkgver=0.3.1.r20.927b502
pkgrel=1
pkgdesc="Hard fork of Hydroxide; a third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
arch=('x86_64')
makedepends=('git' 'go')
conflicts=('ferroxide')
provides=('ferroxide')
url="https://github.com/acheong08/ferroxide"
license=('MIT')
source=('git+https://github.com/acheong08/ferroxide')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/ferroxide"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/ferroxide"
	go build "./cmd/ferroxide"
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/ferroxide/ferroxide" "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/ferroxide/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
