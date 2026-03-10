# Maintainer: Daringcuteseal <daringcuteseal at gmail dot com>

pkgname=python-commitizen
pkgver=4.13.9
pkgrel=1
pkgdesc="Create committing rules for projects, auto bump versions, and auto changelog generation"
arch=('any')
url="https://github.com/commitizen-tools/commitizen"
license=('MIT')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-uv-build'
)
depends=(
	'python-argcomplete'
	'python-colorama'
	'python-decli'
	'python-jinja'
	'python-packaging'
	'python-pyaml'
	'python-questionary'
	'python-termcolor'
	'python-tomlkit'
	'python-importlib-metadata'
	'python-deprecated'
	'python-charset-normalizer'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"uv-build.patch"
)

sha256sums=('9871f3580cfd2c3de08a380edff4afce5adc3d4ab90c51d9b5540eb1b2ee6529'
	'9fd2104b5b2ad48df2c7a6de335bd3d55009227ac7179d6d4981a2eac68779f5')

_pkgname="${pkgname/python-/}"

prepare() {
	patch -d $_pkgname-$pkgver -Np1 -i ../uv-build.patch
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
