# Maintainer: Groctel <aur@taxorubio.com>

_name=moderngl

pkgname=python-moderngl-git
pkgver=5.7.4.r47.g1c33db79
pkgrel=1
pkgdesc="Modern OpenGL binding for python."

arch=('any')
license=('MIT')
url="https://github.com/moderngl/moderngl"

source=("git+$url.git")
sha512sums=('SKIP')

options=(!emptydirs)

depends=(
	'libgl'
	'python'
)
makedepends=(
	'git'
	'python-setuptools'
)

pkgver ()
{
	cd "$srcdir/$_name"
	git describe --long --tags | sed 's/^networkx-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build ()
{
	cd "$srcdir/$_name"
	python setup.py build
}

package ()
{
	cd "$srcdir/$_name"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
