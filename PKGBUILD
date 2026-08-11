# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pyname=click-prompt
pkgname=python-${_pyname}
pkgver=0.7.1
pkgrel=1
pkgdesc="Interactive command line options for the click library "
arch=('any')
url="https://github.com/markusgrotz/${_pyname}"
_urlraw="https://raw.githubusercontent.com/markusgrotz/${_pyname}"
license=('MIT')
depends=('python>=3.6.9' 'python-click>=8.0.4' 'python-questionary>=1.10.0' 'python-validators>=0.22')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core>=1.0.0' 'python-poetry-plugin-export' 'python-platformdirs<5.0' 'python-platformdirs>=3.9.1')

source=("${url}/releases/download/v${pkgver}/${_pyname//-/_}-${pkgver}.tar.gz"
		"${_urlraw}/v${pkgver}/LICENSE.md"
		"${_urlraw}/v${pkgver}/README.md")
sha256sums=('4558d2d3a8a7e0187fa3ab6b2cc0bfa0c1d7d840245d64fbe09060eba94a9fc8'
            '5061afc6ba9d8284c7e71207215a9c9a8d89929cf2e51848e7984d82b70c21c0'
            '368419e1e45392514a3b6fad3ef242bd602d98e49df474eb30cb6b25afce370d')

prepare() {
	cd "${_pyname//-/_}-${pkgver}"

	sed -e 's|\(requires = \["uv_build\)[^"]*\("\]\)|\1\2|g' -i "./pyproject.toml"
}

build() {
	cd "${_pyname//-/_}-${pkgver}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${_pyname//-/_}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
