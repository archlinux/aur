# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>

_name=ManimPango

pkgname=python-manimpango
pkgver=0.4.0.post0
pkgrel=1
pkgdesc="C binding for Pango using Cython used in Manim to render (non-LaTeX) text."

arch=('any')
license=('GPL3')
url="https://manimpango.manim.community"

source=("https://github.com/ManimCommunity/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('430d43f2dac1d421ae239f5ddf2741df57b77e242dcb01591e3d837115cbccdaa9ed06dadfdbeb74df8cc3ee791a0c5797fbc50107fb8fa94b1fae7871baa7dd')

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
