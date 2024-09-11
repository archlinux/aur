# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

_base=pylibssh
pkgname=python-${_base}
pkgver=1.2.2
pkgrel=1
pkgdesc="Python bindings specific to Ansible use case for libssh"
arch=(x86_64)
url="https://github.com/ansible/${_base}"
license=(LGPL-2.1)
depends=(libssh)
makedepends=(cython python-build python-expandvars python-installer python-setuptools python-setuptools-scm python-toml python-wheel)
source=("${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('33bd6cfb39067de3cdbb2c71dc635aa7a71ddf3cdd1f0c135462c48d7478442a3e30d06a7d249dcbc7b56decc13c518aa692c34964c5e04f45b47be363047a38')

build() {
  cd "${_base}-${pkgver}"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$_base-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
