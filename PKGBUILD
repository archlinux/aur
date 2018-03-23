# Maintainer: Daniel Peukert <dan.peukert@gmail.com>

_pkgname=qr-filetransfer
pkgname="$_pkgname-git"
pkgver=r13.8b609c5
pkgrel=1
pkgdesc="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal."
arch=('any')
url="https://github.com/claudiodangelis/$_pkgname/"
license=('MIT')
makedepends=('go' 'git')
provides=("$_pkgname")
options=('!strip' '!emptydirs')
source=("$_pkgname::git://github.com/claudiodangelis/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	go build
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
