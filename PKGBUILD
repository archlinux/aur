# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=python-tikzplotlib-git
pkgver=0.9.1.r5.gd9f636f
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/tikzplotlib"
makedepends=('python')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pillow')
replaces=('python-matplotlib2tikz')
conflicts=('python-matplotlib2tikz')
license=('MIT')
arch=('any')
source=("tikzplotlib::git+https://github.com/nschloe/tikzplotlib.git")
sha256sums=('SKIP')

pkgver() {
	cd tikzplotlib
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/tikzplotlib"
    python setup.py build
}

package() {
    cd "$srcdir/tikzplotlib"
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
