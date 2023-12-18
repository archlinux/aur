# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-vapor-steam
pkgver=1.4.0
pkgrel=2
pkgdesc="TUI program to check the ProtonDB compatibility of all the games of a Steam user"
arch=('any')
url="https://github.com/TabulateJarl8/vapor"
license=('GPLv3')
# linkify-it-py isn't included in the python-textual package for some reason
depends=('python-aiohttp' 'python-rich' 'python-textual' 'python-platformdirs' 'python-linkify-it-py')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
_name=${pkgname#python-}
_name=${_name//-/_}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('40d90f133b04cfafc1a26d43b1b2bfb6b8ef8b198f88d3f32baae309e9dea00338c887c804850be79207bedf7911cc385a31b55220ec7b82a1813b3b9e7ab147')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
