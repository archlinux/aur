# Maintainer: aksr <aksr at t-com dot me>
pkgname=goagrep-git
pkgver=r163.063f2dd
pkgrel=2
pkgdesc="A agrep-like fuzzy matching, but made faster using Golang and precomputation."
arch=('i686' 'x86_64')
url="https://github.com/schollz/goagrep"
makedepends=('git' 'go')
conflicts=("${pkgname%-*}")
_gourl=github.com/schollz/goagrep

pkgver() {
	GOPATH="$srcdir" go get -d ${_gourl}
	cd "$srcdir/src/${_gourl}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	GOPATH="$srcdir" go get -fix -v ${_gourl}
}

package() {
	cd "$srcdir"
	install -Dm755 bin/goagrep "$pkgdir/usr/bin/goagrep"
	install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
