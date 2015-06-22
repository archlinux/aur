# Maintainer: cherti <aur@letopolis.de>

pkgname=robustirc-bridge-git
_pkgname=robustirc-bridge
pkgver=20150317
pkgrel=1
pkgdesc='Bridge to robustirc.net-IRC-Network, latest version from git'
arch=(i686 x86_64)
url='https://github.com/robustirc/bridge'
license=('BSD-3-clause')
depends=('go')
conflicts=('robustirc-bridge')


build() {

	GOPATH="$srcdir" go get github.com/robustirc/bridge/robustirc-bridge

}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -p -m755 "$srcdir/src/github.com/robustirc/bridge/robustirc-bridge.service" "$pkgdir/usr/lib/systemd/system"


	mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 "$srcdir/src/github.com/robustirc/bridge/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/share/man/man1"
	install -Dm644 "$srcdir/src/github.com/robustirc/bridge/robustirc-bridge.1" "$pkgdir/usr/share/man/man1"
}
