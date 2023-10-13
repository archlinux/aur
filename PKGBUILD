# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>

_name=ManimPango

pkgname=python-manimpango
pkgver=0.4.4
pkgrel=1
pkgdesc="C binding for Pango using Cython used in Manim to render (non-LaTeX) text."

arch=('x86_64')
license=('MIT')
url="https://manimpango.manim.community"

source=("https://github.com/ManimCommunity/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('da2708375b26d4ff8704c0137aafa1411ff9c4a4240a7798b1b3b7c3901b4b393bcc9b21a258d96a31a208234e526667e7832912da89fc5e933c7975d67c5705')

depends=(
	'cairo'
	'fontconfig'
	'glib2'
	'harfbuzz'
	'pango'
	'python'
	'python-gobject'
)
makedepends=(
	'python-setuptools'
	'cython'
)

prepare()
{
	cd "$_name-$pkgver"

	# relax Cython requirement
	sed -i 's/Cython>=0.29.25,<3.0/Cython>=0.29.25/g' pyproject.toml
}

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
