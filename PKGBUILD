# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

_base=pylibssh
pkgname=python-${_base}
pkgver=1.2.0rc1
pkgrel=1
pkgdesc="Python bindings specific to Ansible use case for libssh"
arch=(x86_64)
url="https://github.com/ansible/${_base}"
license=(LGPL-2.1)
depends=(libssh)
makedepends=(cython python-build python-expandvars python-installer python-setuptools python-setuptools-scm python-toml python-wheel)
source=("${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c9df6346817c38b725f90d49677676f1094323ccd524110040764e8eb02c22a20c0590d19b11495efcc3b5818bf5174c20d2724e998164a81dc7a342305a59e9')

build() {
  cd "${_base}-${pkgver}"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$_base-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
