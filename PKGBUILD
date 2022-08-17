# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-requirements-parser
_gitpkgname=pip-requirements-parser
pkgver=31.2.0
pkgrel=1
pkgdesc='Mostly correct pip requirements parsing library'
arch=('any')
url='https://github.com/nexB/pip-requirements-parser'
license=('MIT')
depends=('python-packaging')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
conflicts=('python-pip-requirements-parser-git')
options=('!strip')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/nexB/pip-requirements-parser/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '56b7a0c4dd8c12be6dfa016164ff0a5773256bffd7e32a1c8b010303a353c299f2a6f9959cc6aa2b88454cc3529dc6526eaeacea1832e45d3768df44d7c9d52b'
)

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -X pycache_prefix=pycache -m installer \
    --destdir="${pkgdir}" dist/*.whl
  rm -rf pycache
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
