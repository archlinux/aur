# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=python-${_appName}
_name=${pkgname#python-}
upstreamName="PyFunceble"
pkgver=0.94.3
pkgrel=1
pkgdesc="The tool to check domains or IP availability."
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
)
optdepends=(
    'python-pypandoc: full description under setup.py'
)
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${upstreamName}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/funilrys/PyFunceble/master/LICENSE"
)
sha256sums=(
    "5df103d26db9306709444b83662117c24851f7c8df34b122df5c97fb481822c1"
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
