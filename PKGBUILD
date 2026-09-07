# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=python-specklepy
pkgver=2026.8.1
pkgrel=1
pkgdesc="The Python SDK for Speckle"
arch=('any')
url="https://github.com/specklesystems/specklepy"
license=('Apache')
depends=(python-appdirs python-attrs python-deprecated python-gql python-httpx python-pydantic python-pydantic-settings python-ujson)
makedepends=(python-build python-installer python-wheel python-hatchling python-hatch-vcs)
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('d0d1c56b09b06b3f744879f7cf27b3495977cef010435f8850f4e1eb4d38263a')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
