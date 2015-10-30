# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=hsync
pkgname=$_pkgname
pkgver=1.1
pkgrel=1
pkgdesc="A filesystem hierarchy synchronizer"
arch=("i686" "x86_64")
url="http://ambrevar.bitbucket.org/$_pkgname/"
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/ambrevar/$_pkgname/get/v$pkgver.tar.bz2")
sha1sums=("5793e756ccdb306baf722270929cba684026a2b2")

build() {
	export GOPATH="$srcdir"
	cd "$srcdir/ambrevar-$_pkgname-9baed1398a15"

	case "$CARCH" in
	x86_64) GOARCH=amd64 ;;
	i686) GOARCH=386 ;;
	esac

	go build -o $_pkgname
}

check() {
	cd "$srcdir/ambrevar-$_pkgname-9baed1398a15"
	go test
}

package() {
	cd "$srcdir/ambrevar-$_pkgname-9baed1398a15"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
