# Maintainer: Bartosz Nowak <mail at bnowak dot net>

_pkgbase=clutch
pkgname=python-clutch
pkgver=3.1.1
pkgrel=1
pkgdesc="Transmission RPC for Python"
arch=('x86_64')
url="https://github.com/mhadam/clutch"
license=('MIT')
depends=('python-pydantic' 'python-requests' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-dephell')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/mhadam/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha512sums=('6d2f3fb14b8063b032e9a28b962fdbff68115b348e93a000fccf175fc1a7f17282814fbe94a5b3f4c975941e9f25a0a9bd9dd9e8117d13aa67a268dd93f98977')

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
