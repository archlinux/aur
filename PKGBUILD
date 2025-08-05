# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

_name=pytest-shard
pkgname=python-$_name
pkgver=0.1.2
pkgrel=3
pkgdesc='Shard tests to support parallelism across multiple machines.'
arch=(any)
url='https://github.com/AdamGleave/pytest-shard'
license=(MIT)
depends=('python>=3.6' python-pytest)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/AdamGleave/pytest-shard/refs/heads/master/LICENSE")
b2sums=('93116de01aa919697e7ba142b8955eb3ea3926e193b24c0241fdfa46c21bba9b8b556427e4a661dce4158ead855e25cce51a9fcb1bf6402364bff60b3dc1e2db'
        '378ae3ae91b4c0fc8d5030ec281cf0c60a26af9f0bdd2abb5f15f0e6b7497f0c403de03ac59b32e3e64acdf010316d2cfd045f8c1f78b2b08d55c343af5c0a0e')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
