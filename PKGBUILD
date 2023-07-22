# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-survey
pkgver=4.5.3
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
source=("https://files.pythonhosted.org/packages/5d/5d/d669db2d16b6c6129910b11eaa66440208f08a7f7e6976f9743376ef56d6/survey-4.5.3.tar.gz")
sha256sums=('6aae39c22db75da122f970e541f5d499c48e11734439d5d9585e4344bf31b3e6')

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
   install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
