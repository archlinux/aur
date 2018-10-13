# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname=python-domain2idna
_name=${pkgname#python-}
pkgver=1.6.1
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
    "https://raw.githubusercontent.com/funilrys/domain2idna/master/LICENSE"
)
sha256sums=(
    "e55f6f934eb6dab00cae7849226f7190e4f5c63a8872460507c6014d088e61ac"
    "3e51a4436b9d46fe6b44ceaff1dcf36e392acb7128130ee8a6a80748a4b087a5"
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
