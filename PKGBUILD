# Maintainer: Tai Lam <taivlam-aur-mpr [dot] tinsmith796 [at] silomails [dot] com>
# Contributor: David P. <megver83@parabola.nu>

pkgname=meme-cli
pkgver=1.0.2
pkgrel=1
pkgdesc="A command line utility for creating memes"
arch=(x86_64 i686 armv7h)
url="https://github.com/nomad-software/meme"
license=('MIT')
makedepends=(go)
options=(!emptydirs)
source=("meme-$pkgver.tar.gz::https://github.com/nomad-software/meme/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c2b3581e47816162b75f4584be2526cf6fcd40b6f86cf619966bd4fa41e68623f1c5c73eaec47ed0bf4e9b638e3a4a3f6d60fb9631210c899257510179d4be57')

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
