# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-mashumaro
pkgver=3.22
pkgrel=1
pkgdesc="A fast and well tested serialization library on top of dataclasses."
arch=('any')
url="https://github.com/Fatal1ty/mashumaro"
license=('Apache')
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools"
    "python-orjson" "python-tomli-w")
depends=("python" "python-pendulum" "python-ciso8601" "python-typing_extensions")
optdepends=(
    "python-pyyaml: for YAML serialization"
    "python-tomli: for TOML deserialization"
    "python-tomli-w: for TOML serialization"
    "python-orjson: for JSON serialization"
)
checkdepends=("python-pytest" "python-pytest-mock" "python-msgpack" "python-pyyaml")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fatal1ty/$_name/archive/v$pkgver.tar.gz")
sha256sums=('f1b02ec751ae72b0f773035e525494849f419a6a4117690287a0f03a4321bc14')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    pytest
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
