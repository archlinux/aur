# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=haredump-git
_pkgname=haredump
pkgver=r11.e5740bc
pkgrel=1
license=("custom:WTFPL")
pkgdesc="Command line tool that dumps data as hare code."
makedepends=(
	"hare"
	"haredo"
	"git"
)

arch=("x86_64" "aarch64")
url="https://git.sr.ht/~autumnull/haredump"
source=("${pkgname%-*}::git+https://git.sr.ht/~autumnull/haredump")

sha512sums=('SKIP')

provides=("haredump")
conflicts=("haredump")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	export LDFLAGS=${LDFLAGS#"-Wl,"}
	haredo
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	PREFIX="$pkgdir/usr" haredo install
}

