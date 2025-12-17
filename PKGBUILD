# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=${_appName}
_name=${pkgname}
upstreamName="${pkgname//-/_}"
pkgver=4.3.1
pkgrel=1
pkgdesc="The tool to check the availability or syntax of domain, IP or URL."
arch=('any')
url="https://pyfunceble.github.io"
license=('Apache 2.0')
conflicts=('pyfunceble-dev')
provides=("pyfunceble=${pkgver}")
depends=(
    'domain2idna'
    'pyfunceble-process-manager'
    'python-alembic'
    'python-box'
    'python-colorama'
    'python-distribute'
    'python-dnspython'
    'python-dotenv'
    'python-inflection'
    'python-msgpack'
    'python-pyaml'
    'python-pymysql'
    'python-pysocks'
    'python-requests'
    'python-ruamel-yaml'
    'python-setuptools'
    'python-shtab'
    'python-sqlalchemy'
    'python-toml'
    'python3'
)
source=("https://files.pythonhosted.org/packages/source/${upstreamName::1}/${upstreamName}/${upstreamName}-${pkgver}.tar.gz" "https://raw.githubusercontent.com/funilrys/PyFunceble/master/LICENSE")
sha256sums=('086edcc808ef47fccb5ffe27fc522a3c32207602d70c34da8e273992b8a51f21'
            'ac4f1fa7ee565806d41b26bc9a0d9f313224730ddf3c0d4f346f3a511c47dd4e')

build() {
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
