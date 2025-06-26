# Maintainer: AlphaLynx <alphalynx@protonmail.com>
# Contributor: Zen <dev@pyl.onl>

pkgname=python-pycpio
_name=${pkgname#python-}
pkgver=1.5.4
pkgrel=1
pkgdesc='Python library for CPIO manipulation'
arch=('any')
url="https://github.com/desultory/$_name"
license=('GPL-2.0-only')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python' 'python-zenlib')
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('51f23b73f921a5957f4536f13372891b991fddaeb986a7b3ede85bfa391d25055f4937a0105cdf873ca4f7ae6d6c3269afa9ac4d9bd329cfead3a3710ff1ca2b')

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

# vim: set ts=4 sw=4 sts=4 et:
