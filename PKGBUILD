# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-sphinxcontrib-napoleon'
pkgname='python-sphinxcontrib-napoleon'
_module='sphinxcontrib-napoleon'
pkgver=0.7
pkgrel=5
pkgdesc='Sphinx "napoleon" extension.'
url="https://sphinxcontrib-napoleon.readthedocs.io"
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz" "python310.patch" "python311.patch")
sha256sums=('407382beed396e9f2d7f3043fad6afda95719204a1e1a231ac865f40abcbfcf8'
            'dd51ef321c6a19c774c9c3683847e30991a2fb9d69e12ca7b223e4a188022923'
            'b4a4353706703be0f49a310223dfb645b2a112f82233b204afa01b5e7b4e1edc')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/python310.patch"
    patch --forward --strip=1 --input="${srcdir}/python311.patch"
}


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package_python-sphinxcontrib-napoleon() {
    depends=('python' 'python-pockets')
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
