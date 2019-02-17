# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=python-${_appName}
_name=${pkgname#python-}
upstreamName="PyFunceble"
pkgver=1.10.1
pkgrel=1
pkgdesc="The tool to check the availability or syntax of domains, IPv4 or URL."
arch=('any')
url="https://funilrys.github.io/PyFunceble/"
license=('MIT')
conflicts=('python-pyfunceble-dev')
depends=(
    'python3'
    'python-distribute'
    'python-setuptools'
    'python-colorama'
    'python-pyaml'
    'python-urllib3'
    'python-requests'
    'python-domain2idna'
)
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${upstreamName}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/funilrys/PyFunceble/master/LICENSE"
)
sha256sums=(
    "3c98717394d665ffa70dab5dea04459c04d85b3d2c9757f454043aea643ba364"
    "b6f0b000fe7b60a2d6d8b31454d705d928c6ffa8783722ba5c0419dd2c9084e4"
)

build() {
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
