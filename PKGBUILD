# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-survey
pkgver=4.5.4
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
source=("https://files.pythonhosted.org/packages/e6/f5/4fbc7e3538c9916da2f3f7e330231e7bae61fc093620927b48c4d4fbdf14/survey-4.5.4.tar.gz")
sha256sums=('c23a4ed7ef405e2ef9b8f5ce4c4e7fa30122660b5f7e490c01a67e8033b4b792')

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
