# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname=domain2idna
_name=${pkgname#}
pkgver=1.7.0
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
    "df89c0fc0494d3a9c5806842b0664ab4042b4615b0b31c37cb9f7d00b840377a"
    "2724d2ee7c0af6df0fb2b8e932958c0f13470078f2edfce182cbbf2a2a8a91cb"
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
