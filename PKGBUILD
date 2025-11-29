# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Zen <dev@pyl.onl>

pkgname=python-pycpio
_name=${pkgname#python-}
pkgver=1.5.6
pkgrel=1
pkgdesc='Python library for CPIO manipulation'
arch=('any')
url="https://github.com/desultory/$_name"
license=('GPL-2.0-only')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python' 'python-zenlib')
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('1c5a51948a84b6dc3f8b5ccfc21747dda27d560e719ffe2ee41ea48c3a988945e779f7b1a422554cb198b88f20f72ebcd8b183de3306309961b2c607b2ea3e91')

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
