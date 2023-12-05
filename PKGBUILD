# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-vapor-steam
pkgver=1.0.0
pkgrel=2
pkgdesc="TUI program to check the ProtonDB compatibility of all the games of a Steam user"
arch=('any')
url="https://github.com/TabulateJarl8/vapor"
license=('GPLv3')
depends=('python-aiohttp' 'python-rich' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
_name=${pkgname#python-}
_name=${_name//-/_}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('635d8d5f7f973fda4ccc7b5c37f49d2a13d5fb6468b846de50b6833eeb6c45316ad1807002e219bc94f190f42a01bd6b9a888dc141e258146d76ab95eb79c89e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
