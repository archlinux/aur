# Maintainer: aksr <aksr at t-com dot me>
pkgname=goawk-git
pkgver=r396.3bbb652
pkgrel=1
pkgdesc="An AWK interpreter written in Go."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/benhoyt/goawk"
makedepends=('git' 'go')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_gourl=github.com/benhoyt/goawk

pkgver() {
	GOPATH="$srcdir" go get -d ${_gourl}
	cd "$srcdir/src/${_gourl}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	GOPATH="$srcdir" go get -fix -v ${_gourl}
}

#check() {
#  GOPATH="$srcdir" go test -v -x ${_gourl}
#}

package() {
	cd "$srcdir"
	install -D -m755 bin/${pkgname%-*} "$pkgdir/usr/bin/${pkgname%-*}"
	install -D -m644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 src/${_gourl}/LICENSE.txt $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
	cp -r src/${_gourl}/examples $pkgdir/usr/share/doc/${pkgname%-*}
}
