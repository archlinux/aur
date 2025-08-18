# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Zen <dev@pyl.onl>

pkgname=python-zenlib
_name=${pkgname#python-}
pkgver=3.1.5
pkgrel=2
pkgdesc='Useful python decorators and utilities'
arch=('any')
url="https://github.com/desultory/$_name"
license=('GPL-2.0-only')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python')
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('900cc0dbdb087d0d294027747eed046dee452ac7dd15cb572ff769e148e07478a5030f8412fdbebcf89db17c6e06df5368fe28ff1df983723e068b9005cba6ce')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    rm -rf test-env
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    CI=true test-env/bin/python -P -m unittest discover tests -v
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
