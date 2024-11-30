# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=ansible_navigator
pkgname=ansible-navigator
pkgver=24.10.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/3c/57/ae38c42784df6cab8f268aa2683b2f22b06b1ab45a30ed8e8a06210913ac/ansible_navigator-24.10.0.tar.gz")
sha256sums=('50f7d17f10e40fa1c70a505dac5a386bce302c6b453b330d732f11ac8813ea29')

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

