# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=adaptix
pkgname=python-$_name
pkgver=3.0.0b2
pkgrel=1
pkgdesc='An utility class for creating instances of dataclasses'
arch=('any')
url='https://github.com/reagento/adaptix'
license=('Apache')
depends=('python>=3.8')
makedepends=(python-build python-installer python-setuptools python-wheel)
provides=(python-dataclass-factory)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('4a87b1fa3167c77ba6f855049bca260521a4880ee10e30a61091307902a30d840635ae80967d838ca476f4d8901ab49c4b27e52b41ae98c25c494a7d23cb2de3')

prepare() {
    cd $_name-$pkgver
    sed -i 's/69.1.0/69.0.3/g' pyproject.toml # setuptools 69.1.0 is not yet available on Arch
}

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
