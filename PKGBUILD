# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-finvizfinance
_pkgname=${pkgname:7}
pkgver=0.14.5
pkgrel=1
pkgdesc="Finviz Finance. Information downloader."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('LGPL')
makedepends=(python-build python-installer python-wheel)
depends=(python
    python-pandas
    python-datetime
    python-requests
    python-bs4
    python-lxml
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('c97fe0e69d681d9108113aed943988561665d0d4dbd64ffa0b666a2899c25899')

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    mv README{,_pypi}.md
}

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
