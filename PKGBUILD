# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

_base=pylibssh
pkgname=python-${_base}
pkgver=1.3.0
pkgrel=1
pkgdesc="Python bindings specific to Ansible use case for libssh"
arch=(x86_64)
url="https://github.com/ansible/${_base}"
license=(LGPL-2.1)
depends=(libssh)
makedepends=(cython python-build python-expandvars python-installer python-setuptools python-setuptools-scm python-toml python-wheel)
source=("${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c3bd313fcd25ccd02d7ef15213d8725a8db9a273f2096f2a68350fc9bbdc04cc3a31715fe3fef1b8d3b6281bbf02dfc489d18bb78d0fb33c0166af2aa9209918')

build() {
  cd "${_base}-${pkgver}"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$_base-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
