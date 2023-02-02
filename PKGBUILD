# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=haredo
pkgver=1.0.1
pkgrel=1
license=("custom:WTFPL")
pkgdesc="A simple and unix-idiomatic build automator."
makedepends=(
	"hare"
)

arch=("x86_64" "aarch64")
url="https://git.sr.ht/~autumnull/haredo"
source=("https://git.sr.ht/~autumnull/haredo/archive/$pkgver.tar.gz")

provides=("haredo")
conflicts=("haredo")

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# remove '-Wl,' prefix if present, since it is only required when the
	# linker is invoked indirectly. Keeping it will cause the linker to
	# fail.
	make LDFLAGS=${LDFLAGS#"-Wl,"}
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make PREFIX="$pkgdir/usr" install
}

sha256sums=('773c6b673c45f0165118c40265b919c0474e3510530c1f74cf85678833c65a28')
