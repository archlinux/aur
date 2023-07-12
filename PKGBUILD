# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-survey
pkgver=4.5.1
pkgrel=1
pkgdesc='A simple library for creating beautiful interactive prompts.'
arch=('any')
url="https://github.com/Exahilosys/survey"
license=('MIT')
depends=('python-wrapio')
makedepends=(
	'python-setuptools'
	'python-setuptools-scm'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-sphinx_rtd_theme'
	'python-sphinx-autodoc-typehints'
	'python-sphinx-paramlinks')
source=("https://files.pythonhosted.org/packages/6e/12/4d56d8130d981f59d604b1012101f045e66109c133a80ca847593d86eb15/survey-4.5.1.tar.gz")
sha256sums=('1a72880901904a083fd6c24de76e2b680c6f0a6af3a9bcae68fefa9ba89af30a')

build() {
	cd "${pkgname#python-}-${pkgver}"
	python -m build --wheel --no-isolation
	cd docs
	sphinx-build -b man ./ ./_build/man/
}

package() {
	export PYTHONHASHSEED=0
	cd "${pkgname#python-}-${pkgver}"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
	install -Dm644 docs/_build/man/${pkgname#python-}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dm644 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
