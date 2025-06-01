# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname=ansible_creator
pkgname=ansible-creator
pkgver=25.5.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d9/e3/923f5c8d6a26a13b2d6a3b640db1923708bd439c5fc368677d61e056e5e2/ansible_creator-25.5.0.tar.gz")
sha256sums=('cb050df5af0fa398a43464fcde8e761170e1cf12131c014dc4bc0c8f64f80632')

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

