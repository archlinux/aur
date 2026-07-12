# Maintainer: Nissar Chababy <contact at funilrys dot com>

pkgname="pyfunceble-process-manager"
upstreamName="${pkgname//-/_}"
pkgver=1.0.10
pkgrel=2
pkgdesc="The process manager library for and from the PyFunceble project."
arch=('any')
url="https://github.com/pyfunceble/process-manager"
license=('Apache 2.0')
provides=("${pkgname}=${pkgver}")
depends=(
    'python-setuptools'
    'python3'
)
source=("https://files.pythonhosted.org/packages/source/${upstreamName::1}/${upstreamName}/${upstreamName}-$pkgver.tar.gz" 'https://raw.githubusercontent.com/pyfunceble/process-manager/refs/heads/master/LICENSE')
sha256sums=('7b657b8e3dfa927f35e9d032225b9014dd462bd70f82b11f9eeefd0aa327a65e'
            '2411ba51f3e77f7f78d00b70641eafc002ba607f36128ea7ccc5678c6aa8a45d')

build() {
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
