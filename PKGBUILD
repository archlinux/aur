# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=python-pycose
_name="${pkgname#python-}"
pkgver=1.0.1
pkgrel=1
pkgdesc="A Python implementation of the COSE specification described in RFC 8152"
arch=(any)
url="https://github.com/TimothyClaeys/pycose"
license=(BSD)
depends=(python python-cbor2 python-cryptography python-ecdsa python-attrs python-certvalidator)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('251538cfa06785b54808f59d43fe24a87be5ab0faea06a5ca3c102fc31d10b1c')

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
