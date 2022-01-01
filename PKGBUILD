# Maintainer: Nissar Chababy <contact at funilrys dot com>

_appName="pyfunceble"
pkgname=${_appName}
_name=${pkgname}
upstreamName="PyFunceble"
pkgver=4.0.2
pkgrel=3
pkgdesc="The tool to check the availability or syntax of domain, IP or URL."
arch=('any')
url="https://pyfunceble.github.io"
license=('Apache 2.0')
conflicts=('pyfunceble-dev')
provides=("pyfunceble=${pkgver}")
depends=(
    'domain2idna'
    'python-alembic'
    'python-box'
    'python-colorama'
    'python-cryptography'
    'python-distribute'
    'python-dnspython'
    'python-dotenv'
    'python-inflection'
    'python-msgpack'
    'python-pyaml'
    'python-pymysql'
    'python-requests'
    'python-ruamel-yaml'
    'python-setuptools'
    'python-shtab'
    'python-sqlalchemy'
    'python-toml'
    'python3'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${upstreamName}-${pkgver}.tar.gz" "https://raw.githubusercontent.com/funilrys/PyFunceble/master/LICENSE")
sha256sums=('5a7e870920e9ce1b0119e0d0be19c87cc3ff48102ac1382ad92eddf4406b0dcb'
            '69e9c471f1cd9c0dd18f32588c8fffa81f53c54d8d04a1af8603e50a8d35e19d')

build() {
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
