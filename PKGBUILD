# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=python-pycose
_name="${pkgname#python-}"
pkgver=1.1.0
pkgrel=1
pkgdesc="A Python implementation of the COSE specification described in RFC 8152"
arch=(any)
url="https://github.com/TimothyClaeys/pycose"
license=(BSD)
depends=(python python-cbor2 python-cryptography python-ecdsa python-attrs python-certvalidator)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('702f73c7d9b865052862407e768515aca1d7c6fb3df3c90d169fecf913ae071f')  # Official

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
