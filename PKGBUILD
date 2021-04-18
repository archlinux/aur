# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-manimpango
_name=ManimPango
pkgver=0.2.6
pkgrel=1
pkgdesc="C binding for Pango using Cython used in Manim to render (non-LaTeX) text."
arch=('any')
url="https://manimpango.manim.community"
license=('GPL3')
depends=(
	'cairo'
	'harfbuzz'
	'pango'
	'python'
	'python-gobject'
)
makedepends=(
	'python-setuptools'
	'cython'
)
provides=()
source=("https://github.com/ManimCommunity/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('4944ca2c3afa7bad54738d7d9c81c3c7d8348eac40fd5614a8f1f430ec85084de10de0bd1d970edd4cd3674bbdec375ca86351cf2ce0a7d429409fd6d32d72d8')

build() {
	cd "$srcdir/$_name-$pkgver"
	rm -f ManimPango/*.c
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}

