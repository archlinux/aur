# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=ansible_creator
pkgname=ansible-creator
pkgver=24.11.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/6c/4e/0e9075f3a4eedcc2a8e87fc126da033a9ddb797279d93ee7132fd87fba6b/ansible_creator-24.11.0.tar.gz")
sha256sums=('21f0baa7a37798f2b3c34a17e1c51873f95a33e8e4d2a68c66e39fd8bd33399f')

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

