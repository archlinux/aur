# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=python-pycose
_name="${pkgname#python-}"
pkgver=0.9.dev8
pkgrel=1
pkgdesc="A Python implementation of the COSE specification described in RFC 8152"
arch=(any)
url="https://github.com/TimothyClaeys/pycose"
license=(BSD)
depends=(python python-cbor2 python-cryptography python-ecdsa python-attrs python-certvalidator)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('43dc10e908d09e0afac011e518b026ba513204378f405cf885b822b26c63383e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    export PYTHONHASHSEED=0

    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    pytest
}
