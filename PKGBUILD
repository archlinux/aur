# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=ansible_creator
pkgname=ansible-creator
pkgver=24.10.0
pkgrel=1
pkgdesc="A CLI tool for scaffolding all your Ansible Content."
arch=('any')
url="https://github.com/ansible/ansible-creator"
license=('Apache-2.0')
depends=(python python-{jsonschema,onigurumacffi} ansible-{core,runner} podman)
makedepends=(python-{build,installer,pip,setuptools,setuptools-scm,wheel})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
provides=('ansible-creator')
conflicts=('ansible-creator')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/3e/a0/365dea170ef334b0fd666d75cac128b0e66ca59eb372ad11fcd8d98b2b93/ansible_creator-24.10.0.tar.gz")
sha256sums=('b281d9b4a266c4f56f12a03ef67cc40904c31399ee4cf4799876e8fa8aad0543')

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

