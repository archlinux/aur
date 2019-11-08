# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname=domain2idna
_name=${pkgname#}
pkgver=1.9.1
pkgrel=1
pkgdesc="The tool to convert domains the famous IDNA format."
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
    "150f566a2b0362b5c4c04cf1e4e4c9077364cd4864f099d372251438e1b8e0b3"
    "38cf10645c6571b1c3ce266b19763ad95f11023947ef40251f62558483a026c7"
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
