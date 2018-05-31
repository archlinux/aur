# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgname=('python-securesystemslib')
pkgver=0.11.1
pkgrel=1
pkgdesc="Cryptographic and general-purpose routines for Secure Systems Lab projects at NYU"
arch=('any')
license=('MIT')
url="https://github.com/secure-systems-lab/securesystemslib"
depends=('python-cryptography' 'python-pynacl' 'python-colorama' 'python-six')
optdepends=()
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/secure-systems-lab/securesystemslib/archive/v${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/secure-systems-lab/securesystemslib/releases/download/v${pkgver}/securesystemslib-${pkgver}.tar.gz.asc")

sha512sums=('d7de7c0ad3af7b02d072295b2a2b5554b55cdd605cb2adb70d416ad3726855352b67713279ce42221bd5320581fb9b37bb338456333807d84a83312564c42c2a'
            'SKIP')

validpgpkeys=("3E87BB339378BC7B3DD0E5B25DEE9B97B0E2289A"
    # Vladimir Diaz (upstream maintainer)
    )

build() { 
    cd "${srcdir}/securesystemslib-${pkgver}"
    python setup.py build
}

package_python-securesystemslib() {
    depends=("python")

    cd "securesystemslib-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

check() {
    depends=("python-tox")

    cd "securesystemslib-${pkgver}"
    tox -e py36
}
