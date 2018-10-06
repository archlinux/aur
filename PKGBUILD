# Maintainer: Cookie Engineer <@cookiengineer>

pkgname=hydroxide-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
arch=('x86_64')
makedepends=('git' 'go')
url="https://github.com/emersion/hydroxide"
license=('MIT')
_gourl="github.com/emersion/hydroxide"

build() {
	GOPATH="$srcdir" go get -fix -v -x ${_gourl}/cmd/hydroxide
}

check() {
	GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/cmd/hydroxide
}

package() {

	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/lib/go"
	cp -Rv --preserve=timestamps "$srcdir/src" "$pkgdir/usr/lib/go"

	install -Dm644 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

