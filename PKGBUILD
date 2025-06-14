# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-sslpsk-pmd3
_pkgname="${pkgname#python-}"
pkgver=1.0.3
pkgrel=3
pkgdesc='Fork of sslpsk with support for latest python versions'
arch=('x86_64')
url='https://github.com/doronz88/sslpsk-pmd3'
license=('Apache-2.0')
depends=('python' 'openssl')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('62a5764870053c55e7aba00bab5de2533ba2dc79a575f3f2693a9df320045d82')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgname}-${pkgver}"
#   local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
#   export PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}"
#   python setup.py test
# }

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
