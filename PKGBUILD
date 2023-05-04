# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-hologram
pkgver=0.0.16
pkgrel=2
pkgdesc="JSON schema generation from dataclasses"
arch=('any')
url="https://github.com/dbt-labs/hologram"
license=('MIT')
makedepends=("python-pytest")
depends=("python" "python-dateutil" "python-jsonschema")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbt-labs/$_name/archive/v$pkgver.tar.gz"
    "84bbe862ef6a2fcc8b8ce85b5c9a006cc7dc1f66.patch")
sha256sums=('b9d241a93624c7926035e181424b7be44fc398bf68285823c27532e91ff992da'
            '5169e30eb2e32fc3f50a42f6a76a6af3971a9c898144911e163fa43cca197b98')

prepare(){
    cd $_name-$pkgver
    patch --forward --strip=1 --input="${srcdir}/84bbe862ef6a2fcc8b8ce85b5c9a006cc7dc1f66.patch"
}

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python -m pytest
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
