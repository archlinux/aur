pkgname=gtkcord3
pkgver=0.0.4
pkgrel=3
pkgdesc='Discord client written in go and gtk3'
arch=('any')
url='https://github.com/diamondburned/gtkcord3'
license=('GPL3')
depends=('gtk3' 'libhandy' 'discordlogin-git')
provides=('gtkcord3')
conflicts=('gtkcord3-git')
makedepends=('git' 'go')
source=('https://github.com/diamondburned/gtkcord3/archive/v0.0.4.tar.gz'
	'gtkcord3.desktop')
sha256sums=('704c623393d79cc8abb68ac59a5b243576df6857626276ec3fdf15fc9b7c753f'
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
	install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/gtkcord.png"
}

