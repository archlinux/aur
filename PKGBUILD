# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=python-tikzplotlib-git
pkgver=0.10.1.r2.g450712b
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/texworld/tikzplotlib"
makedepends=(git python-flit-core python-build python-installer python-wheel)
depends=(python python-matplotlib python-numpy python-pillow python-webcolors)
provides=("python-tikzplotlib=$pkgver")
conflicts=(python-matplotlib2tikz python-tikzplotlib)
replaces=(python-matplotlib2tikz)
license=(MIT)
arch=(any)
source=("tikzplotlib::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/tikzplotlib"
	git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
	cd "$srcdir/tikzplotlib"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/tikzplotlib"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
