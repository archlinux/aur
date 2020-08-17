# Contributor: John Jenkins <twodopeshaggy@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=nes-git
pkgver=r192.c94772f
pkgrel=1
pkgdesc="NES emulator written in Go."
arch=('i686' 'x86_64')
url="https://github.com/fogleman/nes"
license=('MIT')
makedepends=('git' 'go' 'mercurial')
options=('!strip' '!emptydirs')
_gourl=github.com/fogleman/nes

pkgver() {
	GOPATH="$srcdir" go get -d ${_gourl}
	cd "$srcdir/src/${_gourl}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	GOPATH="$srcdir" go get -fix -v ${_gourl}
}

check() {
	GOPATH="$srcdir" go test -v -x ${_gourl}
}

package() {
	cd "$srcdir"
	install -D -m755 bin/nes "$pkgdir/usr/bin/nes"
	install -D -m644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 src/${_gourl}/LICENSE.md $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
