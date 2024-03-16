# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-darkgraylib
_pkgname="${pkgname#python-}"
pkgver=1.1.0
_commit=4413a5234ed8e8c51bf4cf3a3301e5f65fbef965 # tags/v1.1.0
pkgrel=1
pkgdesc='Filter linter messages from various Python linters to only those which were caused by recent changes to the code base being linted'
arch=(any)
url="https://github.com/akaihola/darkgraylib"
license=("BSD-3-Clause")
depends=(
	'python'
	'python-toml'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
checkdepends=(
	'python-pytest'
	'python-pygments'
	'python-pytest-kwparametrize'
)
optdepends=('python-pygments: syntax highlighting')
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	python -m build --no-isolation
}

check() {
	cd "${pkgname}"
	PYTHONPATH=src pytest -v "src/${_pkgname}"
}

package() {
	cd "${pkgname}"
	python -m installer -d "${pkgdir}" dist/*.whl
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
