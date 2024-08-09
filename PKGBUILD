# Maintainer: RubenKelevra <cyrond@gmail.com>
# Contributor: frankspace <frank@frankspace.com>
# Contributor: wenLiangcan <boxeed@gmail.com>

pkgname='pip2pkgbuild'
pkgver='0.5.0'
pkgrel=2
pkgdesc="Create PKGBUILD files for Python modules fetched with PIP"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=(
	'python>=3.12'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
license=('MIT')
conflicts=("python2-$pkgname")
arch=('any')
source=(
	"${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('d0e8e90b312a033c66a79b51a53b5b7d4199bacfe569a2a6fb20aa6c01735bda6a55feaa5f65abd15f062bf0b8534d928632cb6c84869b871c5a2db1064175c1'
)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
