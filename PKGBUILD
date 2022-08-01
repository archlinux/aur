# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=dephell_specifier
pkgname=python-dephell-specifier
pkgver=0.2.2
pkgrel=5
pkgdesc="Work with version specifiers"
arch=('any')
url="https://github.com/dephell/${_pkgname}"
license=('MIT')
depends=('python-packaging')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b5ec6409a1916980c4861da2cb7538246555bff4b95bef2c952c56bd19eb2de6')
b2sums=('eb7656c3c713fd842cc4b3f342d77d88efef773e03845a28244b4071a1db8d73051d4afc17301823878ddadd01c58be19a5fc6f8e5fed03ae73fb97b5c44ea83')

build(){
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python -m pytest
}

package() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
