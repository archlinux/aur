# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-mashumaro
pkgver=3.17
pkgrel=2
pkgdesc="A fast and well tested serialization library on top of dataclasses."
arch=('any')
url="https://github.com/Fatal1ty/mashumaro"
license=('Apache')
makedepends=("python-build" "python-installer" "python-wheel"
    "python-orjson" "python-tomli-w")
depends=("python" "python-pendulum" "python-ciso8601" "python-typing_extensions")
optdepends=(
    "python-pyyaml: for YAML serialization"
    "python-tomli: for TOML deserialization"
    "python-tomli-w: for TOML serialization"
    "python-orjson: for JSON serialization"
)
checkdepends=("python-pytest" "python-pytest-mock" "python-msgpack")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fatal1ty/$_name/archive/v$pkgver.tar.gz")
sha256sums=('a9457dc5b064656d4a8c089ae7fd95da73b4b02ef948dcefee10bceeddffc46b')

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
