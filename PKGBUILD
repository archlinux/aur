# Maintainer: DeedleFake <deedlefake at users dot noreply dot github dot com>
pkgname=upspin-git
pkgver=r1433.0d288a48
pkgrel=1
pkgdesc="A global name system of sorts."
arch=(i686 x86_64)
url="https://upspin.io"
license=('BSD')
makedepends=('go>=1.8' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/upspin/upspin")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"

	GOPATH="$srcdir/gopath"
	mkdir -p "$GOPATH/src"
	mv "$srcdir/${pkgname%-git}" "$GOPATH/src/upspin.io"

	go get -v upspin.io/cmd/...
}

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/usr"
	cp -a "$srcdir/gopath/bin" "$pkgdir/usr/bin"
}
