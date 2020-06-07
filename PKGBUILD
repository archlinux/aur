# Maintainer: aksr <aksr at t-com dot me>
pkgname=murex-git
pkgver=r1402.aa3f3b7e
pkgrel=1
pkgdesc="Bash-like shell designed for greater commandline productivity and safer shell scripts"
arch=('i686' 'x86_64')
url="https://github.com/lmorg/murex"
license=('GPL')
makedepends=('git' 'go')
_gourl=github.com/lmorg/murex

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
	install -D -m755 bin/murex "$pkgdir/usr/bin/murex"
	install -D -m644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
	cd "src/${_gourl}"
	cp -r docs $pkgdir/usr/share/doc/${pkgname%-*}
}

