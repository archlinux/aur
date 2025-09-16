# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pyhash=3417addbe2d5058d3368f48679d757e32954dfd831b8c46c423ac88e7dfabf5a
_pyname=click-prompt
pkgname=python-${_pyname}
pkgver=0.6.5
pkgrel=1
pkgdesc="Interactive command line options for the click library "
arch=('any')
url="https://github.com/markusgrotz/${_pyname}"
_urlraw="https://raw.githubusercontent.com/markusgrotz/${_pyname}"
license=(MIT)
depends=('python>=3.6.9' 'python-click>=8.0.4' 'python-click<9.0' 'python-questionary>=1.10.0' 'python-validators>=0.22')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core>=1.0.0' 'python-poetry-plugin-export' 'python-platformdirs<5.0' 'python-platformdirs>=3.9.1')

source=("https://files.pythonhosted.org/packages/${_pyhash:0:2}/${_pyhash:2:2}/${_pyhash:4}/${_pyname//-/_}-${pkgver}.tar.gz"
		"${_urlraw}/v${pkgver}/LICENSE.md"
		"${_urlraw}/v${pkgver}/README.md")
sha256sums=('eb493274fe4415ddd2ec9f6dc2706fa9dc16b72e6982d1f621b1e370e3d46345'
            '5061afc6ba9d8284c7e71207215a9c9a8d89929cf2e51848e7984d82b70c21c0'
            '45c4495be54a492baec4f491464deb72ee9c186193119e21c863ebbb1f2f1f92')

build() {
	cd "click_prompt-${pkgver}"

	python -m build --wheel --no-isolation
}

package() {
	cd "click_prompt-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
