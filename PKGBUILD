# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgname=python-securesystemslib
pkgver=0.11.3
pkgrel=1
pkgdesc="Cryptographic and general-purpose routines for Secure Systems Lab projects at NYU"
arch=('any')
license=('MIT')
url="https://github.com/secure-systems-lab/securesystemslib"
depends=('python-cryptography' 'python-pynacl' 'python-colorama' 'python-six')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/secure-systems-lab/securesystemslib.git?signed@tag=${pkgver}")

sha512sums=("SKIP")


validpgpkeys=("3E87BB339378BC7B3DD0E5B25DEE9B97B0E2289A"
    # Vladimir Diaz (upstream maintainer)
    "C2FB9C910758B6827BC43233BC0C6DEDD5E5CC03"
    # Sebastien Awwad (upstream co-maintainer)
    )

build() { 
    cd "${srcdir}/securesystemslib"
    python setup.py build
}

package_python-securesystemslib() {

    cd "securesystemslib"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "securesystemslib"
    python tests/aggregate_tests.py
}
