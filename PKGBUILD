# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
pkgname=python-earcut
_pkgname=earcut
pkgver=1.15
pkgrel=1
pkgdesc="A pure Python port of the earcut JS triangulation library"
arch=('any')
url="https://github.com/vojtatom/${_pkgname}.py"
license=('ISC')
depends=('python' 'python-pip')
makedepends=('python-setuptools')
source=("${url}/archive/refs/heads/master.tar.gz")
sha256sums=('89173d1870b9eaca4dabdc6e51d3ce72e7a038c56ae94598c666a6d59b4efc58')

build() {
  cd "${srcdir}/${_pkgname}.py-master"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}.py-master"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}

