# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-inplace
_gitpkgname=inplace
pkgver=1.0.0
pkgrel=1
pkgdesc='In-place file processing in Python'
arch=('any')
url='https://github.com/jwodder/inplace'
license=('MIT')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/jwodder/inplace/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'ef5f751b86c3f1663d5710862b72280bb9ff7e1d6742033be7b56d6a5ac79304d39f9f3bbcbc7d9dc6c80cebfd0f3d9e74679c3e48f4979c5344bb390b6a1231'
)

build() {
  cd "${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.rst'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
