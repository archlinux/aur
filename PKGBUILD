# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgname=python-securesystemslib
pkgver=0.11.2
pkgrel=1
pkgdesc="Cryptographic and general-purpose routines for Secure Systems Lab projects at NYU"
arch=('any')
license=('MIT')
url="https://github.com/secure-systems-lab/securesystemslib"
depends=('python-cryptography' 'python-pynacl' 'python-colorama' 'python-six')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/secure-systems-lab/securesystemslib/archive/sslibv${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/secure-systems-lab/securesystemslib/releases/download/sslibv${pkgver}/securesystemslib-sslibv${pkgver}.tar.gz.asc")

sha512sums=('6831e1d912dce48d93a344a3d375b56e301ac47fdef11392abf2538650b6dfe7069152fb7163a9d8403e73f606237b3c0f70d5c39da2f11a89a7a4815be2979f'
            'SKIP')

validpgpkeys=("3E87BB339378BC7B3DD0E5B25DEE9B97B0E2289A"
    # Vladimir Diaz (upstream maintainer)
    )

build() { 
    cd "${srcdir}/securesystemslib-sslibv${pkgver}"
    python setup.py build
}

package_python-securesystemslib() {

    cd "securesystemslib-sslibv${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "securesystemslib-sslibv${pkgver}"
    python tests/aggregate_tests.py
}
