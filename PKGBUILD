# Maintainer: Daringcuteseal <daringcuteseal at gmail dot com>

pkgname=python-commitizen
pkgver=4.1.0
pkgrel=1
pkgdesc="Create committing rules for projects, auto bump versions, and auto changelog generation"
arch=('any')
url="https://github.com/commitizen-tools/commitizen"
license=('MIT')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
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
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4621efc570082b2defa94e6759ee9e52ca6a8d9bf07836ebcca48ed60133409a')

_pkgname="${pkgname/python-/}"

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
