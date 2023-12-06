# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-vapor-steam
pkgver=1.1.0
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
sha512sums=('46bc9521a964eed7b4632c2d521c3070dd2ee83d52867dd7d69362e887dc658abae65a5776595a7cdb406be8acf8fb4571efb30d65cdcd4412cb2f53a7555bf2')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
