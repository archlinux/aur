# Maintainer: Daringcuteseal <daringcuteseal at gmail dot com>

pkgname=python-commitizen
pkgver=4.19.2
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
)

sha256sums=('6480250ac4dfcd60e6bb7d389fdf30fda806767cf249e010044ae6e35291a326')

_pkgname="${pkgname/python-/}"

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
