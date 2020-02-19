# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=${_appName}
_name=${pkgname}
upstreamName="PyFunceble"
pkgver=3.0.0
pkgrel=2
pkgdesc="The tool to check the availability or syntax of domains, IPv4, IPv6 or URL."
arch=('any')
url="https://funilrys.github.io/PyFunceble/"
license=('MIT')
conflicts=('pyfunceble-dev')
provides=("pyfunceble=${pkgver}")
depends=(
    'domain2idna'
    'python-box'
    'python-colorama'
    'python-cryptography'
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
    "https://raw.githubusercontent.com/funilrys/PyFunceble/master/LICENSE"
)
sha256sums=(
    "69a78960edb9dafb10ad74eb63aba821dd6468cdf4777ccb7849633f2642984a"
    "a11e4be5b3b09e157217214008e7f0e23092d26adb03ad593e51cffe18361508"
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
