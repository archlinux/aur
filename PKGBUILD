# Maintainer: Sylvain Poulain <sylvain.poulain@giscan.com>
_base=pdfgpt
pkgname=python-${_base}
pkgver=0.2.2
pkgrel=1
pkgdesc="pdfgpt is a Python package that provides users with the ability to engage in natural language conversations with their PDF documents."
arch=(any)
url="https://github.com/Mariosmsk/${_base}"
license=('MIT')
depends=(python-pandas python-openai python-matplotlib python-scikit-learn python-scipy python-tiktoken python-pypdf)
source=(${_base}-${pkgver}.tar.gz::https://github.com/Mariosmsk/${_base}/archive/refs/heads/main.tar.gz)
b2sums=('1feb83fd402b89fece6253bb16c2288006985bd75f710ebad8b332c9e3aecb26047df8f2ca3dfe96cb74f91e2b79e30061ebbbb2e0017cbf5a56e0b373746bed')

build() {
  cd ${_base}-main
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-main
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
