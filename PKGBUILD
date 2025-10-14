# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Zen <dev@pyl.onl>

pkgname=python-pycpio
_name=${pkgname#python-}
pkgver=1.5.5
pkgrel=2
pkgdesc='Python library for CPIO manipulation'
arch=('any')
url="https://github.com/desultory/$_name"
license=('GPL-2.0-only')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python' 'python-zenlib')
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('8771c4c154d3a93c1ca37441ec39ea1d141828d3c5652dcec3801bed44fa053bac9f77e98b8edafc4d0693d502d944ef8d7966e44d9c9693c3141cca48024d50')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    rm -rf test-env
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m unittest discover tests -v
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
