# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Zen <dev@pyl.onl>

pkgname=python-pycpio
_name=${pkgname#python-}
pkgver=1.7.0
pkgrel=1
pkgdesc='Python library for CPIO manipulation'
arch=(any)
url="https://github.com/desultory/$_name"
license=(GPL-2.0-only)
depends=(python python-zenlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('b4479df7b02bc2bc8751b1b833c0d82829383c9475544c11469facec172e2a54e4ee156e29b9a71c65bbd9ab7102448eee5c299e853bf470f39c3c55c4eff302')

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
