# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=hsync
pkgname=$_pkgname
pkgver=1.2
pkgrel=1
pkgdesc="A filesystem hierarchy synchronizer"
arch=("i686" "x86_64")
url="http://ambrevar.bitbucket.org/$_pkgname/"
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/ambrevar/$_pkgname/get/v$pkgver.tar.bz2")
sha1sums=("e5accc924d130387a2f816f5520c15c404f015cf")

build() {
	export GOPATH="$srcdir"
	cd "$srcdir/ambrevar-$_pkgname-9fc4fdee2d55"

	case "$CARCH" in
	x86_64) GOARCH=amd64 ;;
	i686) GOARCH=386 ;;
	esac

	go build -o $_pkgname
}

check() {
	cd "$srcdir/ambrevar-$_pkgname-9fc4fdee2d55"
	go test
}

package() {
	cd "$srcdir/ambrevar-$_pkgname-9fc4fdee2d55"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
