# Maintainer: Bartosz Nowak <mail at bnowak dot net>

_pkgbase=clutch
pkgname=python-clutch
pkgver=4.1.0
pkgrel=1
pkgdesc="Transmission RPC for Python"
arch=('x86_64')
url="https://github.com/mhadam/clutch"
license=('MIT')
depends=('python-pydantic' 'python-requests' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-dephell')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/mhadam/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha512sums=('5d174b7f0987fc4cc92e9d261c357690d3d6a59ba18a870c2a2feb3eddb6072603b9af2926bea7ffa936c8e223ce6836e3a2e7949ac3254a54e8baa1d15507b1')

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
