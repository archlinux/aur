# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-gcsfs'
_module='gcsfs'
pkgver='2025.7.0'
pkgrel=1
pkgdesc="Pythonic file-system interface for Google Cloud Storage."
url="http://gcsfs.readthedocs.io/en/latest/"
#checkdepends=('docker' 'python-pytest' 'python-pytest-timeout' 'python-vcrpy')
depends=(python python-aiohttp python-click "python-fsspec>=$pkgver" python-google-auth
    python-google-auth-oauthlib
    python-requests python-decorator)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=(python-crcmod)
license=('BSD-3-Clause')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dask/gcsfs/archive/$pkgver.tar.gz")
sha256sums=('ffdc59490685375729e8ee227cea549c630f774a15d37f51db9dc5f0e86a8fa8')

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
