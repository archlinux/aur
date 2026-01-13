# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-vapor-steam
pkgver=1.7.0
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
sha512sums=('17d3181f416f98aac5165630db034019c0a1afd684076adcfd9d9aa644300659a3101920287365f6bd41f8dd56e96f81c4a923779c86d16f151c1daa3e516fa0')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    pytest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
