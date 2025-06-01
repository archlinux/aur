# Contributor: Marco Rubin <marco.rubin@protonmail.com>

_name=pytest-shard
pkgname=python-$_name
pkgver=0.1.2
pkgrel=2
pkgdesc='Shard tests to support parallelism across multiple machines.'
arch=(any)
url='https://github.com/AdamGleave/pytest-shard'
license=(MIT)
depends=('python>=3.6' python-pytest)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://github.com/AdamGleave/pytest-shard/blob/master/LICENSE")
b2sums=('93116de01aa919697e7ba142b8955eb3ea3926e193b24c0241fdfa46c21bba9b8b556427e4a661dce4158ead855e25cce51a9fcb1bf6402364bff60b3dc1e2db'
        'faa8a2c550727b6e9bbc43a482d123f6de245223b0284cd7ed9f349168d2ad6faf8928f773151fed85e712bb09707d87189633763eddabafe2fdbc7e1ac6fb51')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
