# Maintainer: Bartosz Nowak <mail at bnowak dot net>

_pkgbase=clutch
pkgname=python-clutch
pkgver=3.1.3
pkgrel=1
pkgdesc="Transmission RPC for Python"
arch=('x86_64')
url="https://github.com/mhadam/clutch"
license=('MIT')
depends=('python-pydantic' 'python-requests' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-dephell')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/mhadam/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha512sums=('79842ed4521e864735c95fa1deeb3f8c5a2a0bf4725bb928420fe9dc1ca694129983bd943355a75c439dd8015d3897b6f1794bf3bb582bb5323069eadfb84c12')

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
