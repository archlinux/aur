# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname="ansible_dev_environment"
pkgname="ansible-dev-environment"
pkgver=25.7.0
pkgrel=1
pkgdesc="A pip-like install for ansible collections."
arch=('x86_64')
url="https://github.com/ansible/ansible-dev-environment"
license=('GPLv3')
depends=(python python-{jsonschema,onigurumacffi} ansible-{core,runner} git)
makedepends=(python-{build,installer,pip,setuptools,setuptools-scm,wheel})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2133694c9ef51e3bdd5d87b90525a08c2739c9f213e76c61d51cd621001d4b32')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" ${srcdir}/${pkgname}-${pkgver}/dist/*.whl
}
