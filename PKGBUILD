# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-vapor-steam
pkgver=1.0.2
pkgrel=1
pkgdesc="TUI program to check the ProtonDB compatibility of all the games of a Steam user"
arch=('any')
url="https://github.com/TabulateJarl8/vapor"
license=('GPLv3')
depends=('python-aiohttp' 'python-rich' 'python-textual' 'python-platformdirs')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
_name=${pkgname#python-}
_name=${_name//-/_}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('7850ec7e6aae8a32c98c92a8fa328f7021ed792b94e0db7b1aa45c769f2dc55ea80bb9d0ba6e7dfd9749d36187d01a90a083c6574ababcfe7a43a28691d1bf68')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
