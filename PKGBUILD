# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=pyclip
pkgname=python-${_pkgname}
pkgver=0.6.0
pkgrel=2
pkgdesc='Cross-platform clipboard utilities supporting both binary and text data'
arch=(any)
url="https://pypi.org/project/${_pkgname}/"
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
optdepends=(
	'xclip: Support for X11'
	'wl-clipboard: Support for Wayland'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/spyoungtech/pyclip/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('eb67f5f832f80d69ac985a9c16fd1e01edf016c278fc48329af81aa48a98f634835ba018a4d1a278a4117e9550f9d09a2776c353d7a37c77dc3d1f146a7d3af2')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
