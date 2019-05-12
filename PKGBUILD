pkgname=certspotter
pkgver=0.9
pkgrel=1
pkgdesc='Certificate Transparency Log Monitor'
arch=('x86_64')
url="https://github.com/SSLMate/$pkgname"
_gourl='software.sslmate.com/src/certspotter/cmd/certspotter'
license=('MPL2')
makedepends=('go')


prepare() {
	GOPATH="$srcdir" go get -d -fix -v "$_gourl"
}

build() {
	export GOFLAGS="-gcflags=all=-trimpath=$PWD -asmflags=all=-trimpath=$PWD -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
	GOPATH="$srcdir" go install "$_gourl"
}

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -m755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
