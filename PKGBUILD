# Maintainer: David P. <megver83@parabola.nu>

pkgname=meme-cli
pkgver=1.0.1
pkgrel=1
pkgdesc="A command line utility for creating memes"
arch=(x86_64 i686 armv7h)
url="https://github.com/nomad-software/meme"
license=('MIT')
makedepends=(go)
options=(!emptydirs)
source=("meme-$pkgver.tar.gz::https://github.com/nomad-software/meme/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1fe4733e77ed49ca4634c5adcf3a5c506ee4e96506f96778c43f47b06c4b9bdc')

prepare() {
	cd "meme-$pkgver"
	go get -u -v
}

build() {
        cd "meme-$pkgver"
        go mod vendor -v
	go build -v
}

package() {
	cd "meme-$pkgver"
	GOPATH="$pkgdir/usr" go install -v
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
