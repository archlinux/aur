# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=pyasn1-alt-modules
pkgname=python-$_name
pkgver=0.4.10
pkgrel=1
pkgdesc="Alternative ASN.1 modules for pyasn1"
arch=(any)
url=https://github.com/russhousley/pyasn1-alt-modules
license=(BSD-2-Clause)
depends=(python-pyasn1)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=($_name::git+https://github.com/russhousley/$_name.git#tag=$pkgver)
b2sums=('bd7d4ad4d7b9d669d5bf373c78edf2ba33310fdd50a419e98e994a721541788c72642a101430a3fb77be75cfaf21f38a2f0c58063c84dd3bfa46ee17161d79ad')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m unittest -v
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
