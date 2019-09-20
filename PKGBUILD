# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=${_appName}-dev
_name=${pkgname}
upstreamName="PyFunceble-dev"
pkgver=2.11.1
pkgrel=1
pkgdesc="The tool to check the availability or syntax of domains, IPv4 or URL."
arch=('any')
url="https://funilrys.github.io/PyFunceble/"
license=('MIT')
provides=("${_appName}")
conflicts=('pyfunceble')
provides=("pyfunceble=${pkgver}")
depends=(
    'domain2idna'
    'python-colorama'
    'python-distribute'
    'python-dnspython'
    'python-dotenv'
    'python-pyaml'
    'python-pymysql'
    'python-requests'
    'python-setuptools'
    'python-urllib3'
    'python3'
)
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${upstreamName}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/funilrys/PyFunceble/dev/LICENSE"
)
sha256sums=(
    "64bba418dd2f56669f396ee3d88fb1c806fb587a336482b180408d1f36b78d26"
    "f03d3823524595a13999f7f0805b4189805e60a620175dc71e89ead03495c49f"
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
