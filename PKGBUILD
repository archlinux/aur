# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-lpc_checksum
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
pkgdesc="Python script to calculate LPC firmware checksums, based on the C version by Roel Verdult. It can be used as a standalone application, or as a Python module that integrates directly in a build environment (e.g. SCons). It does not need to be compiled."
arch=('any')
url="https://github.com/basilfx/lpc_checksum"
license=('MIT')
depends=('python' 'python-intelhex')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm' 'python-poetry'
             'python-anyio' 'python-libtmux' 'python-pytest' 'python-pytest-curio' 'python-pytest-timeout')

source=("${_name}-$pkgver.tar.gz::https://github.com/basilfx/lpc_checksum/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a52530513eb5ddd7ef475321f8c408177fc680730b1049dcec4893908e15d2f0')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
  cd $_name-$pkgver
  python -m pytest
}