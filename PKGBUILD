# Maintainer: Nissar Chababy <contact at funilrys dot com>

upstreamName=zerorpc
gitHubRepo="0rpc/${upstreamName}-python"
pkgname="python-${upstreamName}"
pkgver=0.6.3
pkgrel=1
pkgdesc="An easy to use, intuitive, and cross-language RPC"
arch=('any')
url="https://github.com/0rpc/zerorpc-python"
license=('MIT')
provides=("${pkgname}")
depends=(
    'python3'
    'python-distribute'
    'python-setuptools'
    'zeromq'
    'python-msgpack'
    'python-pyzmq'
    'python-gevent'
    'python-future'
)
source=(
    "https://files.pythonhosted.org/packages/source/${upstreamName::1}/${upstreamName}/${upstreamName}-${pkgver}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/${gitHubRepo}/master/LICENSE"
)
sha256sums=(
    "d2ee247a566fc703f29c277d767f6f61f1e12f76d0402faea4bd815f32cbf37f"
    "bfd3d67e2c911cb9184cd41d56be9964978cdcb31ea0684ba956c6f2aa47d22f"
)

build() {
    echo "https://files.pythonhosted.org/packages/source/${upstreamName::1}/${upstreamName}/${upstreamName}-${pkgver}.tar.gz"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${srcdir}/${upstreamName}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
