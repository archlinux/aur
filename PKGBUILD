# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=ansible_navigator
pkgname=ansible-navigator
pkgver=24.9.0
pkgrel=2
pkgdesc="A text-based user interface (TUI) for Ansible."
arch=('any')
url="https://github.com/ansible/ansible-navigator"
license=('Apache-2.0')
depends=(python python-{jsonschema,onigurumacffi} ansible-{core,runner} podman)
makedepends=(python-{build,installer,pip,setuptools,setuptools-scm,wheel})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
provides=('ansible-navigator')
conflicts=('ansible-navigator')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/4d/13/7e2700329ed9b866c10dcf696a2e1633da2eb3ac705c49abe0d63ab4beba/ansible_navigator-24.9.0.tar.gz")
sha256sums=('796dfcfe7def87697684aae1d71a56d9f881e723a44e72bbec09debc34ad0fbb')

build() {
  ln -sf "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" ${srcdir}/${pkgname}-${pkgver}/dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

