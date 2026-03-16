# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

_base=pylibssh
pkgname=python-${_base}
pkgver=1.4.0
pkgrel=1
pkgdesc="Python bindings specific to Ansible use case for libssh"
arch=(x86_64)
url="https://github.com/ansible/${_base}"
license=(LGPL-2.1)
depends=(libssh)
makedepends=(cython python-build python-expandvars python-installer python-setuptools python-setuptools-scm python-toml python-wheel)
source=("${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('21b2a14d4b4f7d6aeb29c73a1cefda54d90f435376a65ca84b43d56c11a238d2049704868847abde75d29798e97891c830e8e476214f2dc4355573ef890d2949')

build() {
  cd "${_base}-${pkgver}"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$_base-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
