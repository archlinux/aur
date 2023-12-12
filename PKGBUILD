# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-vapor-steam
pkgver=1.3.0
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
sha512sums=('e8166329ec88f6996b689dc32913ab92851971f953a412eb33543d92d209e830d1af13bf2eb5217a0cd4aa048f26b1003ea5c4b98746939a42d1ea7351214cb6')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
