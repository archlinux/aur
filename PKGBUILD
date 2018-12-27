# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=python-${_appName}
_name=${pkgname#python-}
upstreamName="PyFunceble"
pkgver=1.0.0
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
    "e35d4c026ec29cc3f205667913bb59b14710ed7e0733f2f28d5eb3b88606002d"
    "a6446256d9e2281e96a2279c0cf0d424700a311d9f2ad6e71e1a5bbb9abd5f29"
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
