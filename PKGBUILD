# Maintainer: teraflops <prietus@live.com>
pkgname=lsimg-git
_pkgname=lsimg
pkgver=r1.d052eb7
pkgrel=1
pkgdesc="Like ls, but for images — thumbnail grid in your terminal (kitty/iTerm2/sixel)"
arch=('any')
url="https://github.com/prietus/lsimg"
license=('MIT')
depends=('bash' 'imagemagick')
optdepends=('kitty: kitten icat helper for the kitty graphics protocol')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/prietus/lsimg.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	# Use the latest tag if there is one, otherwise rN.shorthash.
	if git describe --long --tags >/dev/null 2>&1; then
		git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 lsimg "$pkgdir/usr/bin/lsimg"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
