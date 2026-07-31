# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=python-specklepy
pkgver=2026.6.0
pkgrel=1
pkgdesc="The Python SDK for Speckle"
arch=('any')
url="https://github.com/specklesystems/specklepy"
license=('Apache')
depends=(python-appdirs python-attrs python-deprecated python-gql python-httpx python-pydantic python-pydantic-settings python-ujson)
makedepends=(python-build python-installer python-wheel python-hatchling python-hatch-vcs)
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('77d90885db230478c26cfe45cb468773f27681835dad600b238c8990ee52ca2c')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
