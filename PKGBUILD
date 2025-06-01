# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=ansible_navigator
pkgname=ansible-navigator
pkgver=25.5.0
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/fc/12/a34f8457bc3b33e0b393770b287f276f8aa249511d8172d0c10edccf23cf/ansible_navigator-25.5.0.tar.gz")
sha256sums=('7c616ed4099c148ccc50bfebed2bcaee3b2c9134226a74ba632eb1b9b35d98d9')

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

