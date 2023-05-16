# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=Flask-Limiter
pkgname=python-flask-limiter
pkgver=3.3.1
pkgrel=1
pkgdesc="Rate limiting for flask applications"
url="https://flask-limiter.readthedocs.org"
depends=('python' 'python-flask' 'python-limits' 'python-ordered-set' 'python-rich' 'python-typing_extensions')
makedepends=(python-setuptools python-build python-installer python-wheel)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('2b99fec0cfc44f490bd729da52bb89c5c4158f38812d0f3854c01d0a83664923')

# Depends on python-hiro, which isn't packaged
# check() {
#     cd "${srcdir}/${_pkgname}-${pkgver}"
#     PYTHONPATH=./build/lib pytest
# }

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    #patch --forward --strip=1 --input="${srcdir}/5d53a3db098188d5b93ee58cdd6b3867caacf661.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
