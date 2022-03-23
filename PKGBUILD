# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>

_name=ManimPango

pkgname=python-manimpango
pkgver=0.4.1
pkgrel=1
pkgdesc="C binding for Pango using Cython used in Manim to render (non-LaTeX) text."

arch=('any')
license=('GPL3')
url="https://manimpango.manim.community"

source=("https://github.com/ManimCommunity/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('ef428784cba33d25898e4a601da41e7eb0951bd8e5ef15eea93d61bb3e3fc8167be24507c685379d3e0d914aa18ab1adb2bc1f5b55c8aae5a6b21495bb6d6197')

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

build ()
{
	cd "$srcdir/$_name-$pkgver"
	rm -f ManimPango/*.c
	python setup.py build
}

package ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
