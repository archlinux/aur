# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
_pkgname=flask_limiter
pkgname=python-flask-limiter
pkgver=3.10.1
pkgrel=1
pkgdesc="Rate limiting for flask applications"
url="https://flask-limiter.readthedocs.org"
depends=('python' 'python-flask' 'python-limits' 'python-ordered-set' 'python-rich' 'python-typing_extensions')
makedepends=(python-setuptools python-build python-installer python-wheel)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('5ff8395f2acbc565ba6af43dc4b9c5b0a3665989681791d01dfaa6388bb332c6')

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
