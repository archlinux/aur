# Maintainer: Bartosz Nowak <mail at bnowak dot net>

_pkgbase=clutch
pkgname=python-clutch
pkgver=6.0.0
pkgrel=1
pkgdesc="Transmission RPC for Python"
arch=('x86_64')
url="https://github.com/mhadam/clutch"
license=('MIT')
depends=('python-pydantic' 'python-requests' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-dephell')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/mhadam/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha512sums=('2922cde172f094cc71438f1b2713c3de27bdd5e5ff8c57e932688121d49d6d8fd4e6c8f8fc7521ff00c3c62d2b18daeaf4bc7ec99767092905e2e7d19fdabec9')

prepare() {
    cd "${_pkgbase}-${pkgver}"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "${_pkgbase}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgbase}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
