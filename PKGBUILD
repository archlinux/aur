# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-survey
pkgver=4.5.2
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
source=("https://files.pythonhosted.org/packages/94/5b/b3429928b766e38c155a8f01cae3ebec3c56760ed9dc73f172f04e28a926/survey-4.5.2.tar.gz")
sha256sums=('bab2bea5fe01855e20ab20c00e00f6d4f17beae62fbe3aa017159e6455ef567b')

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
