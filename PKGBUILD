# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-pypemicro
_pkgname=${pkgname#python-}
pkgver=0.1.11
pkgrel=1
pkgdesc="Python interface for PEMicro debug probes precompiled libraries"
arch=('any')
url="https://github.com/nxpmicro/pypemicro"
license=('BSD-3-Cause')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
            )
depends=('python')
source=(https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('022cfa0d5db24cac636f0e6d70d31fb3873023debf46636d5da3e3c109301c70ca26601847300d06ef29c9168033cc3deecb9268e38dfba18c99558049f4fad9')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
