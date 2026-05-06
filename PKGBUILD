# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

_pkgname=sphinxcontrib-bibtex
pkgname="python-${_pkgname}"
pkgver=2.7.0
pkgrel=1
pkgdesc="A Sphinx extension for BibTeX style citations"
arch=('any')
url="https://sphinxcontrib-bibtex.readthedocs.org"
license=('BSD-2-Clause')
depends=('python-sphinx' 'python-pybtex' 'python-pybtex-docutils' 'python-docutils')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest' 'python-numpydoc' 'python-sphinx-autoapi')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mcmtroffaes/${_pkgname}/archive/${pkgver}.tar.gz")
b2sums=('75aea173bcac48d7634adcac15fa4573e6f2f30ef1ce4f39dd863692262cebffeb5eb100fe8ba7be6291becaba6ce07a5454792a88dcfcf22864957e2160629b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHONPATH="${PWD}/build/lib:${PWD}/src:${PYTHONPATH}" pytest -k 'not test_citation_rinoh'
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
