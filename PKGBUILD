# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: jmcb <joelsgp@protonmail.com>
# Contributor: Jonas DOREL <jonas at dorel dot me>

pkgname=python-prospector
_name=prospector
pkgver=1.20.1
pkgrel=1
pkgdesc="Python static analysis tool"
url="https://github.com/PyCQA/prospector/"
depends=('python')
optdepends=('bandit: security linter'
            'mypy: optional type checking'
            'python-pyroma: check setup.py'
            'vulture: find dead code'
            'python-ruff: python linter'
            'pyright: python type checker')
makedepends=('python-poetry'
             'python-wheel')
license=('GPL-2.0-only')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_name}-dev/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f1515cd13dd18e9dcb38a99a24c9fe4f7bb7118c213c7019713be42de32174ed')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	depends+=(
		'python-pylint'
		'python-pylint-celery'
		'python-pylint-django'
		'python-requirements-detector'
		'python-yaml'
		'python-mccabe'
		'python-pyflakes'
		'python-pycodestyle'
		'python-pep8-naming'
		'python-pydocstyle'
		'python-dodgy'
		'python-toml'
		'python-setoptconf'
		'python-packaging'
		'python-flake8')

	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
