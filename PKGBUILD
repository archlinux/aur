# Maintainer: Axel Juraske <moin@axju.de>

pkgname=python-mynux
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=2
pkgdesc="Just a dotfile manager with some extras."
arch=(any)
url="https://pypi.org/project/mynux/"
license=(MIT)
depends=(python) 
makedepends=(python-build python-installer python-wheel)
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('12277a4c48a3bbf3417849f76ca700367da5fde6ba8d92f0093bb7964dbc3948')

build() {
    cd "$_name-$pkgver"
    env PATH=$(getconf PATH) python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    env PATH=$(getconf PATH) python -m installer --destdir="$pkgdir" dist/*.whl
}

