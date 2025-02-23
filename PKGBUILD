# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-python-pcapng
_pkgname="${pkgname#python-}"
pkgver=2.1.1
pkgrel=2
pkgdesc='Pure-Python library to parse the pcap-ng format used by newer versions of dumpcap & similar tools'
arch=('any')
url='https://github.com/rshk/python-pcapng'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e0f86a62b83071430121e63f818d73af88e6aca40165a904cf078e2479166958')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m pytest -o addopts=""
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
