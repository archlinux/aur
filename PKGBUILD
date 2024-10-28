# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-gcsfs'
_module='gcsfs'
pkgver='2024.10.0'
pkgrel=1
pkgdesc="Pythonic file-system interface for Google Cloud Storage."
url="http://gcsfs.readthedocs.io/en/latest/"
#checkdepends=('docker' 'python-pytest' 'python-pytest-timeout' 'python-vcrpy')
depends=(python python-aiohttp python-click "python-fsspec>=$pkgver" python-google-auth
    'python-google-auth-oauthlib'
    'python-requests' 'python-decorator')
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=()
license=('BSD-3-Clause')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dask/gcsfs/archive/$pkgver.tar.gz")
sha256sums=('3ef1352f4f5bacf06af7288f3aad1f502d983e395a69b095c4878c504be5cfc0')

#check() {
    #cd "${_module}-${pkgver}"
    #pytest
#}

build() {
    cd "${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
