pkgname=gtkcord3
pkgver=0.0.1
pkgrel=1
pkgdesc='Discord client written in go and gtk3'
arch=('any')
url='https://github.com/diamondburned/gtkcord3'
license=('GPL3')
depends=('gtk3' 'discordlogin-git')
conflicts=('gtkcord3-git')
provides=('gtkcord3')
makedepends=('git' 'go')
source=('https://github.com/diamondburned/gtkcord3/archive/v0.0.1.tar.gz'
	'gtkcord3.desktop')
sha256sums=('371a4c34528a1be8e00ad706724a31e1a0e2f08d1a5580dabbbc384f77697c9b'
	'8839b86e0a4174d5b5f3f7aa1248ee6af26901e4b5d4e749088444e1861982a4')

build() {
	# check if user has already set their GoLang path
	if [[ -z "${GOPATH}" ]]; then
		GOPATH="${srcdir}/go"
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

