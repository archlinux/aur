# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=python-${_appName}-dev
_name=${pkgname#python-}
upstreamName="PyFunceble-dev"
pkgver=0.119.0
pkgrel=1
pkgdesc="The tool to check the availability of domains, IPv4 or URL."
arch=('any')
url="https://funilrys.github.io/PyFunceble/"
license=('MIT')
provides=("${_appName}")
conflicts=('python-pyfunceble')
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
    "https://raw.githubusercontent.com/funilrys/PyFunceble/dev/LICENSE"
)
sha256sums=(
    "e3997cd4d7db7b804911cc573bf73d38960a87fb9fc8a2b266d27842e9aafed1"
    "a6446256d9e2281e96a2279c0cf0d424700a311d9f2ad6e71e1a5bbb9abd5f29"
)

build() {
    echo "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${upstreamName}-${pkgver}.tar.gz"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
