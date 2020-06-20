# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='google-font-download'
pkgver='1.4.2'
pkgrel='4'
pkgdesc='Google Fonts web font downloader'
arch=('any')
url="https://github.com/neverpanic/$pkgname"
license=('BSD')
depends=('curl' 'ncurses')
checkdepends=('xxd')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-local-name.patch::$url/commit/722822978dd4183ed44661a634e5982270b52cbf.patch"
)
sha256sums=('7779cc4cbad7504c823c7db5a07a48f7e7b553ee82b1f1d8c88237f1b95336dc'
            '38b1b2792b54a003591f77f88b7061e6551b78b6d58d54331a2dcb750a6fd1f8')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-local-name.patch"
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	make syntax-check
	make test
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
