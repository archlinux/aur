# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname="ansible_dev_environment"
pkgname="ansible-dev-environment"
pkgver=25.5.0
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/1e/0d/1e8cf80f57b41074585e5a77b03025fa48100996ddd387abeb057f911ab0/ansible_dev_environment-25.5.0.tar.gz")
sha256sums=('eda6b18dc8084c053bfaac9ec92a52812d2932c55200ddf9bec1ebf6d2fc0d28')

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
