# Maintainer: emnl <github.com/Ema0>

pkgname=mpdviz
pkgver=0.4.7
pkgrel=2
pkgdesc='Standalone console MPD visualizer'
arch=('x86_64' 'i686' 'ARM')
url='https://github.com/lucy/mpdviz'
license=('custom:MIT')
makedepends=('go')
depends=('fftw')
options=('!strip')

source=("$pkgname::git+https://github.com/lucy/$pkgname.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	export GOPATH="$srcdir"
	go mod init "${url#https://}"
        go mod tidy
}

build() {
	cd "$srcdir/$pkgname"
	export GOPATH="$srcdir"
	go clean
	go build -o mpdviz
}

package() {
	cd "$srcdir/$pkgname"
	install -T -Dm755 mpdviz "$pkgdir/usr/bin/mpdviz"
	install -T -Dm644 _mpdviz "$pkgdir/usr/share/zsh/site-functions/_mpdviz"
	install -T -Dm644 LICENSE "$pkgdir/usr/share/licenses/mpdviz/LICENSE"
}
