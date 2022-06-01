# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_base=pythontexfigures
pkgname=python-${_base}
pkgdesc="Embed matplotlib figures into LaTeX documents using PythonTeX"
pkgver=0.2.0
pkgrel=3
arch=(any)
_commit_version='55bf83a495cf7b4f0d408fa834f430e3fcd5d95f'
url="https://github.com/mje-nz/${_base}"
license=('custom:BSD-3-clause')
depends=(python-matplotlib python-pygments)
makedepends=(git python-setuptools)
# checkdepends=(python-pytest texlive-pictures fvextra) # python-seaborn
source=("git+${url}.git#commit=${_commit_version}")
sha512sums=('SKIP')

build() {
  cd ${_base}
  python setup.py build
}

# check() {
#   cd ${_base}
#   # https://github.com/mje-nz/pythontexfigures/blob/master/.circleci/config.yml#L23
#   python -m pytest
# }

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 Readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
