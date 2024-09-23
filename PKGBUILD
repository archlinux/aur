# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=ansible_creator
pkgname=ansible-creator
pkgver=24.9.0
pkgrel=1
pkgdesc="A CLI tool for scaffolding all your Ansible Content."
arch=('any')
url="https://github.com/ansible/ansible-navigator"
license=('Apache-2.0')
depends=(python python-{jsonschema,onigurumacffi} ansible-{core,runner} podman)
makedepends=(python-{build,installer,setuptools,wheel,setuptools-scm})
#makedepends=(python-{build,installer,setuptools,wheel,setuptools-scm,setuptools-scm-git-archive})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
provides=('ansible-creator')
conflicts=('ansible-creator')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/6e/1c/46c00f69a398f1d6de633706502de146428243c3280df71901794b873ca7/ansible_creator-24.9.0.tar.gz")
sha256sums=('ae3dbdf0550aef77da8866c6e297816016f32e43c53b402eb02f6553952e89bc')

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

