# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>

_name=ManimPango

pkgname=python-manimpango
pkgver=0.4.0.post2
pkgrel=1
pkgdesc="C binding for Pango using Cython used in Manim to render (non-LaTeX) text."

arch=('any')
license=('GPL3')
url="https://manimpango.manim.community"

source=("https://github.com/ManimCommunity/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('82ec933a2483107e0b7ea0a11abb658a795d9d9464be2e3b86cbdbb5fe2edfb617f6633e70872c3ff334c54f608761aea22416821c5c267422f55bc57d2c0411')

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
