# Maintainer: aksr <aksr at t-com dot me>
pkgname=script-git
pkgver=r4.42b1d41
pkgrel=1
pkgdesc="Command to supervise interactive execution of another command, such as the shell."
arch=('i686' 'x86_64')
url="https://github.com/robpike/script"
license=('custom: 3-Clause BSD')
makedepends=('git' 'go')
_gourl=robpike.io/cmd/script

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
	install -D -m755 bin/script "$pkgdir/usr/bin/script"
	install -D -m644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
