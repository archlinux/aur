# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-menuinst
_name=${pkgname#python-}
pkgver=2.1.1
pkgrel=1
pkgdesc="Cross platform menu item installation"
arch=(any)
url=https://github.com/conda/menuinst
license=(BSD-3-Clause)
depends=(
    python-importlib-metadata
    python-pydantic
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
    python-wheel
)
source=(git+https://github.com/conda/menuinst.git#tag=$pkgver)
b2sums=('7a00d48fb7b5ced7c24bd0d056b3ba4ce5407d083e2b14ead68bb382d4104c0fd2c0e1cdf91c01300f98acf37e2577f34ebd349c67258509ac567498870f58aa')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
