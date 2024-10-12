# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname="ansible_dev_environment"
pkgname="ansible-dev-environment"
pkgver=24.9.0
pkgrel=2
pkgdesc="A pip-like install for ansible collections."
arch=('x86_64')
url="https://github.com/ansible/ansible-dev-environment"
license=('GPLv3')
depends=(python python-{jsonschema,onigurumacffi} ansible-{core,runner} git)
makedepends=(python-{build,installer,pip,setuptools,setuptools-scm,wheel})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/46/24/7e1ea40bc098144cd4744cddd8c0af70b1c0e13ab0b28c73324968f1c885/ansible_dev_environment-24.9.0.tar.gz")
sha256sums=('d7a99db207f624dd7e1bb7db706073a8337cdcf57610298dabddff7ce6ef162f')

build() {
  cd "${srcdir}"
  ln -sf "${_pkgname}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" ${srcdir}/${pkgname}-${pkgver}/dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
