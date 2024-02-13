# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-vapor-steam
pkgver=1.5.4
pkgrel=1
pkgdesc="TUI program to check the ProtonDB compatibility of all the games of a Steam user"
arch=('any')
url="https://github.com/TabulateJarl8/vapor"
license=('GPLv3')
# linkify-it-py isn't included in the python-textual package for some reason
depends=('python-aiohttp' 'python-rich' 'python-textual' 'python-platformdirs' 'python-linkify-it-py')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')
_name=${pkgname#python-}
_name=${_name//-/_}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('3cef4143fadfe2a4e3ace5283254381633d101624237be45b17a2d5d8445f3681831c5dd37acf04131c0fdde4da739c0c6a5d3b5c4bafddb1dd4625fc284820d')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check(){
    cd "$srcdir/$_name-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}


