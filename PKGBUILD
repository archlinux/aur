# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

_base=pylibssh
pkgname=python-${_base}
pkgver=1.2.0.post4
pkgrel=2
pkgdesc="Python bindings specific to Ansible use case for libssh"
arch=(x86_64)
url="https://github.com/ansible/${_base}"
license=(LGPL-2.1)
depends=(libssh)
makedepends=(cython python-build python-expandvars python-installer python-setuptools python-setuptools-scm python-toml python-wheel)
source=("${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('4df4f83fbbe68930f5c848f2581ec42f0b50c3878efe7c1cdbcf70b2fc6f2b355f9bb57865539de1737b1c9bde153dcd31e6cf7f68b638e141eb60625f08da1d')

build() {
  cd "${_base}-${pkgver}"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$_base-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
