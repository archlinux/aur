pkgname=discordlogin-git
_pkgname=discordlogin
pkgver=r11.0634b4d
pkgrel=1
pkgdesc='Login/Token component for use with gtkcord3'
arch=('any')
url='https://github.com/diamondburned/discordlogin'
license=('GPL3')
depends=('gtk3')
makedepends=('git' 'go')
source=('git+https://github.com/diamondburned/discordlogin')
sha1sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# check if user has already set their GoLang path
	if [[ -z "${GOPATH}" ]]; then
		GOPATH="${srcdir}/go"
	fi
	cd $_pkgname
	go build -trimpath
}

package() {
	cd $_pkgname
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

