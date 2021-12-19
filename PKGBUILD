# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=python-tikzplotlib-git
pkgver=0.9.16.r2.g1e30229
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/tikzplotlib"
makedepends=(python-build)
depends=(python python-matplotlib python-numpy python-pillow)
replaces=('python-matplotlib2tikz')
conflicts=('python-matplotlib2tikz')
license=('MIT')
arch=('any')
source=("tikzplotlib::git+https://github.com/nschloe/tikzplotlib.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/tikzplotlib"
	git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
	cd "$srcdir/tikzplotlib"
	python -m build
}

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"

	cd "$srcdir/tikzplotlib"
	local cleanver="$(git describe --tags --abbrev=0 | sed 's/^v//')"
	unzip "dist/tikzplotlib-$cleanver-py3-none-any.whl" -d "$site"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
