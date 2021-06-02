# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen@syrusdark.website>

pkgname=python-manimpango
_name=ManimPango
pkgver=0.3.0
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
sha512sums=('60e7e24cff47ec7ad358f9b7f0506d9469aa28c1f3866518b9a9410abd28652a1be86d32af54a66acc5e5a0e3db3caefe29a7b9d801c00591b9d00a3c6332350')

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
