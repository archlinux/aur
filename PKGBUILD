# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=Flask-Limiter
pkgname=python-flask-limiter
pkgver=3.1.0
pkgrel=2
pkgdesc="Rate limiting for flask applications"
url="https://flask-limiter.readthedocs.org"
depends=('python' 'python-flask' 'python-six' 'python-limits')
makedepends=(python-setuptools python-build python-installer python-wheel)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz" 
        "https://github.com/alisaifee/flask-limiter/commit/5d53a3db098188d5b93ee58cdd6b3867caacf661.patch")

sha256sums=('fe2c4da444ddc7e1976fd5aa5fca62213cacf2b68bde04b60140d6bad6dfbd2a'
            'a8196c8081a21d40266c5f3b65e9c56b237b6f8d6a3c7dd0ab0eda90f0e8df3c')

# Depends on python-hiro, which isn't packaged
# check() {
#     cd "${srcdir}/${_pkgname}-${pkgver}"
#     PYTHONPATH=./build/lib pytest
# }

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/5d53a3db098188d5b93ee58cdd6b3867caacf661.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
