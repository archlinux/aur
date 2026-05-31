# Maintainer: Daringcuteseal <daringcuteseal at gmail dot com>

pkgname=python-commitizen
pkgver=4.16.3
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

sha256sums=('d47eb07960536d970a9a34fd359527fe725ebc5cb54147c1fb26e47fdbab6ca9')

_pkgname="${pkgname/python-/}"

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
