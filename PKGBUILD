# Maintainer: Groctel <aur@taxorubio.com>

_name=backports.cached_property

pkgname=python-backports.cached_property
pkgver=1.0.1
pkgrel=1
pkgdesc="Python 3.8 functools.cached_property backport to python 3.6."

arch=('any')
license=('MIT')
url="https://github.com/penguinolog/backports.cached_property"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('c6fa3bba4c450515ae3ce44a52fb9181d494569f18742bc12ac8c5315e93107d301ee59bdc4d468838ee6435e54ab46b027086a03369502858eb63204e2bce32')

depends=('python')
makedepends=(
	'python-setuptools'
	'python-setuptools-scm'
	'python-wheel'
)

build ()
{
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
