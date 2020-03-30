pkgname=gtkcord3
pkgver=0.0.2
pkgrel=2
pkgdesc='Discord client written in go and gtk3'
arch=('any')
url='https://github.com/diamondburned/gtkcord3'
license=('GPL3')
depends=('gtk3' 'libhandy' 'discordlogin-git')
provides=('gtkcord3')
makedepends=('git' 'go')
source=('https://github.com/diamondburned/gtkcord3/archive/v0.0.2.tar.gz'
	'gtkcord3.desktop')
sha256sums=('742529f1756edc0ccc411183fe6c5fa7893259d861d881e607cf0ee84271a1d4'
	'8839b86e0a4174d5b5f3f7aa1248ee6af26901e4b5d4e749088444e1861982a4')

build() {
	# check if user has already set their GoLang path
	if [[ -z "${GOPATH}" ]]; then
		export GOPATH="${srcdir}/go"
	fi
	cd $pkgname-$pkgver
	go build -trimpath
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 gtkcord/components/logo/logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/gtkcord.png"
}

