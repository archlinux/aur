# Maintainer: Bartosz Nowak <mail at bnowak dot net>

_pkgbase=clutch
pkgname=python-clutch
pkgver=4.2.1
pkgrel=1
pkgdesc="Transmission RPC for Python"
arch=('x86_64')
url="https://github.com/mhadam/clutch"
license=('MIT')
depends=('python-pydantic' 'python-requests' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-dephell')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/mhadam/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha512sums=('4a0d1209eff5650b2b6537d5368cf4fb4c2bf77160d9b7b056101c4455cbb6908b950a6c9606e9b7cab7bbc24a5b8ed38cf37af37cfbc87c56db3909a032da4a')

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
