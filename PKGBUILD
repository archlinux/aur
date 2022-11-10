# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=python-pycose
_name="${pkgname#python-}"
pkgver=1.0.1
pkgrel=2
pkgdesc="A Python implementation of the COSE specification described in RFC 8152"
arch=(any)
url="https://github.com/TimothyClaeys/pycose"
license=(BSD)
depends=(python python-cbor2 python-cryptography python-ecdsa python-attrs python-certvalidator)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('af324408e99abec1101060d0ace775695ea805840eb523b98d0ea25611613010')  # Official

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
