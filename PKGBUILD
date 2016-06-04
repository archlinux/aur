# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=hsync
pkgname=$_pkgname
pkgver=1.3
pkgrel=1
pkgdesc="A filesystem hierarchy synchronizer"
arch=("i686" "x86_64")
url="http://ambrevar.bitbucket.org/$_pkgname/"
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/ambrevar/$_pkgname/get/v$pkgver.tar.bz2")
sha1sums=("6c6c12b3364ebb0924cd2cc56844aa58bc3970c5")

build() {
	export GOPATH="$srcdir"
	cd "$srcdir/ambrevar-$_pkgname-2c7344b758a9"

	case "$CARCH" in
	x86_64) GOARCH=amd64 ;;
	i686) GOARCH=386 ;;
	esac

	go build -ldflags "-X main.version=$(git describe --tags --always)" -o $_pkgname
}

check() {
	cd "$srcdir/ambrevar-$_pkgname-2c7344b758a9"
	go test
}

package() {
	cd "$srcdir/ambrevar-$_pkgname-2c7344b758a9"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
