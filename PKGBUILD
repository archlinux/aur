# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=ansible_navigator
pkgname=ansible-navigator
pkgver=24.12.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d1/15/40aae823192f93c8424c8121b71a871b875a2f71066f4070d76e2fff7b95/ansible_navigator-24.12.0.tar.gz")
sha256sums=('f832574b0c132231746ff8b93470ab9d1f4dfa733297ca1ffb3c849a64f36e84')

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

