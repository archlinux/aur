# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname=domain2idna
_name=${pkgname#}
pkgver=1.12.0
pkgrel=2
pkgdesc="The tool to convert a domain or a file with a list of domain to the famous IDNA format."
arch=('any')
url="https://github.com/funilrys/domain2idna"
license=('MIT')
depends=(
    'python3'
    'python-distribute'
    'python-setuptools'
    'python-colorama'
)
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/PyFunceble/domain2idna/master/LICENSE"
)
sha256sums=(
    "7f45b4de5ae261b23270b7f980c2600cd306fa570d4ade9e5935f965327bba2d"
    "08c0daa67e227be62d082aa48d00e990e1192791291293ba683cec88151c6820"
)

build() {
    cd ${srcdir}/${_name}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${_name}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
