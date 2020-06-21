# Maintainer: aksr <aksr at t-com dot me>
pkgname=lisp-git
pkgver=r14.f671945
pkgrel=1
pkgdesc="Toy Lisp 1.5 interpreter"
arch=('i686' 'x86_64')
url="https://github.com/robpike/lisp"
license=('custom: 3-clause BSD')
makedepends=('git' 'go')
_gourl=robpike.io/lisp

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
	install -D -m755 bin/lisp "$pkgdir/usr/bin/lisp"
	install -D -m644 src/${_gourl}/lib.lisp $pkgdir/usr/share/doc/${pkgname%-*}/lib.lisp
	install -D -m644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
