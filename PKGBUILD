# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-mashumaro
pkgver=3.6
pkgrel=1
pkgdesc="A fast and well tested serialization library on top of dataclasses."
arch=('any')
url="https://github.com/Fatal1ty/mashumaro"
license=('Apache')
makedepends=("python" "python-pytest" "python-pytest-mock" "python-orjson" "python-tomli-w")
depends=("python" "python-pendulum" "python-ciso8601" "python-typing_extensions")
optdepends=(
    "python-pyyaml: for YAML serialization"
    "python-msgpack: for msgpack serialization"
    "python-tomli: for TOML deserialization"
    "python-tomli-w: for TOML serialization"
    "python-orjson: for JSON serialization"
)
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fatal1ty/$_name/archive/v$pkgver.tar.gz")
sha256sums=('3f76987d983dc54a2ab4f4d47f5b73f9e54cc9dd2cf78a5ef0ea11abffbfb765')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

check() {
    cd $_name-$pkgver
    pytest
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
